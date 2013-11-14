Title: PMC Notes

> These are some general jottings on occasionally performed tasks by the PMC

ASF documents can be found [here](http://www.apache.org/dev/pmc.html)

## Accessing `people.apache.org`

Must be accessed via ssh.

eg:

    ssh danhaywood@people.apache.org

and when prompted, provide passphrase for private key.

> I've forgotten what I did to set this up in the first place, though :-( 

## LDAP Access (UNIX groups)

Whenever we get a new committer, the ASF LDAP entries must be maintained to grant access to our repos and various other 'karma'.

Log onto `people.apache.org`, then use:

    list_unix_group.pl isis

to list committers

    list_committee.pl isis

to list the PMC committee members (in Isis, every committer should be on the PMC committee)

To change membership of either the committers or the PMC, use:

    modify_unix_group.pl isis --add joebloggs
    modify_unix_group.pl isis --remove joebloggs

and

    modify_committee.pl gump --add joebloggs
    modify_committee.pl gump --remove joebloggs

respectively.

Further details are in [these ASF docs](http://www.apache.org/dev/pmc.html#SVNaccess).  (They talk about SVN access, but really it is LDAP access).  

