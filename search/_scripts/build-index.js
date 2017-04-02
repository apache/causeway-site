#!/usr/bin/env node

'use strict';

// Script includes
const fs = require('fs');
const el = require('elasticlunr');
const jsdom = require('jsdom');
const recursive = require('recursive-readdir');
const crypto = require('crypto');
const optionParser = require('command-line-args');
const path = require('path');

const VERSION = '0.1';
const DESCRIPTION = 'Script to build the "elasticlunr" search index.'
const SCRIPT_NAME = path.basename(process.argv[1]);

/**
 * Calculates the md5 hash of a string and returns the
 * result as an integer.
 */
function hashString(str) {
    var md5 = crypto.createHash('md5');
    var hex_digest = md5.update(str).digest('hex');
    // Convert to integer
    return parseInt(hex_digest.slice(0, 8), 16);
}

/**
 * Sanitises the HTML within a dom node
 * by removing all script and style tags.
 */
function sanitiseHtml(node) {
    for (var child of node.childNodes)
    {
        if (child.tagName && child.tagName.match(/script|style/i))
        {
            node.removeChild(child);
        }
    }
}

/**
 * Truncates a string to a maximum number of words.
 */
function truncateWords(str, words) {
    return str.split(/\b/).slice(0, words * 2).join('');
}

const optionParams = [
    {name: 'index-dir', alias: 'd', type: String, defaultOption: true},
    {name: 'ignore', alias: 'i', type: String, multiple: true},
    {name: 'output', alias: 'o', type: String, defaultValue: './index.json'},
    {name: 'version', alias: 'v', type: Boolean},
    {name: 'verbose', alias: 'V', type: Boolean},
    {name: 'help', alias: 'h', type: Boolean}
];

const options = optionParser(optionParams);

if (options.help)
{
    console.log(SCRIPT_NAME + ' - ' + DESCRIPTION + '\n');
    console.log(
        'Usage: ' + SCRIPT_NAME + ' INDEX-DIR [--ignore FILE1 FILE2 --output OUT-FILE --verbose]'
    );
}
else if (options.version)
{
    console.log(process.argv[0] + ' - v' + VERSION);
}
else
{
    // Ignore non-html files.

    // find all unique file extensions in bash using:
    // for a in `find content -type f -print `; do filename=`basename $a`; fileext=${filename##*.}; echo "$fileext"; done  | sort -u
    
    var ignore = [
            'PNG',
            'cache',
            'css',
            'docx',
            'eot',
            'gif',
            'jar',
            'jpg',
            'js',
            'less',
            'odp',
            'otf',
            'pdf',
            'pdn',
            'png',
            'ppt',
            'pptx',
            'rb',
            'rdf',
            'scss',
            'svg',
            'ttf',
            'woff',
            'woff2',
            'xml',
            'xsd'
            ];

    // Create the index schema.
    var index = el(function () {
        this.addField('title'),
        this.addField('body'),
        this.addField('description'),
        this.addField('url'),
        this.setRef('id')
    });

    if (options.ignore)
    {
        ignore = ignore.concat(options.ignore);
    }

    recursive(options['index-dir'], ignore, function (err, files) {
        if (err)
        {
            console.log(err);
            return;
        }
        for (var file of files)
        {
            var html = fs.readFileSync(file, 'utf-8');
            
            if (options.verbose)
            {
                console.log("Parsing: " + file);
            }
                
            // Parse the DOM.
            var document = jsdom.jsdom(html);
            var meta_title = document.querySelector('meta[property="title"]');
            var article = document.querySelector('article');

            // Only select pages with a title and article section.
            if (meta_title)
            {
                sanitiseHtml(article);

                if (options.verbose)
                {
                    console.log("> indexing");
                }

                var description = document.querySelector('article > p');

                // Fallback to whole article if no paragraphs present.
                if (!description)
                {
                    description = article;
                }
                file = file.replace(new RegExp('^' + options['index-dir']), '');
                file = file.replace(/index\.html$/, '');
                var doc = {
                    title: meta_title.content,
                    body: article.textContent,
                    description: truncateWords(description.textContent, 50),
                    url: file,
                    id: hashString(file)
                };
                index.addDoc(doc);
            }
        }

        // Serialise and write the index.
        var out = index.toJSON();

        // Remove the body field from the documentStore to decrease the size of the index.
        for (var id in out.documentStore.docs)
        {
            delete out.documentStore.docs[id].body;
        }

        if (options.verbose)
        {
            console.log("Serialising to: " + options.output)
        }
        fs.writeFileSync(options.output, JSON.stringify(out), 'utf-8');

        if (options.verbose)
        {
            console.log('done');
        }
        process.exit();
    });
}
