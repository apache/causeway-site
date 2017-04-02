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

const cheerio = require('cheerio');

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
    if(node && node.childNodes) {
        for (var child of node.childNodes)
        {
            if (child.tagName && child.tagName.match(/script|style/i))
            {
                node.removeChild(child);
            }
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
            '*.PNG',
            '*.cache',
            '*.css',
            '*.docx',
            '*.eot',
            '*.gif',
            '*.jar',
            '*.jpg',
            '*.js',
            '*.less',
            '*.odp',
            '*.otf',
            '*.pdf',
            '*.pdn',
            '*.png',
            '*.ppt',
            '*.pptx',
            '*.rb',
            '*.rdf',
            '*.scss',
            '*.svg',
            '*.ttf',
            '*.woff',
            '*.woff2',
            '*.xml',
            '*.xsd'
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

        var html = fs.readFileSync('../content/guides/rgant/rgant.html', 'utf-8');

        //console.log(html)
        
        // Parse the DOM.

        var $ = cheerio.load(html, {
            normalizeWhitespace: true,
            xmlMode: false
        });
        
        var sectionBodies = $( 'div.sectionbody' );
        
        console.log( "sectionBodies : " + sectionBodies.length)
        
        $(sectionBodies).each( function(i, sectionBody) {
            var sectionHeading = $(sectionBody).prevAll('[id]')

            var sectionId = $(sectionHeading).attr('id');
            var sectionTitle = $(sectionHeading).text();
            
            console.log(sectionId + ": " + sectionTitle);
        });

      

        process.exit();

}
