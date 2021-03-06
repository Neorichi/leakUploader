# leakUploader
> Convert to mysql the list with email and password from leak list (Bash based)

## Special characters
Some problems with special characters when making the insert.
The next characters have being replace by:
<pre>" -> [0x22] </pre>
<pre>' -> [0x27] </pre>
<pre>/ -> [0x26] </pre>
<pre>\ -> [0x25] </pre>

#### Important

Add "Example schema table" in your database (Mysql)
<pre>
CREATE TABLE `leaks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) COLLATE utf8_bin NOT NULL,
  `password` varchar(250) COLLATE utf8_bin NOT NULL,
  `collection` varchar(100) COLLATE utf8_bin NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` timestamp NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
</pre>

## Usage
<pre>usage: bash uploader.sh  </pre>
<pre>usage: bash uploader_mongo.sh  </pre>

## Example
Leak List
<pre>
pantiwast@hotmail.com:123456789
paixnidiap@gmail.com:123456789
evelyne_110@live.fr:123456789
hell_aran@live.com:123456789
manuelmaina@hotmail.com:123456789"
muhtesem_yunus027@hotmail.com:123456789/
yovana_caridad_2006@hotmail.com:123456789
yous_@hotmail.it:123456789
kamron.marshall@yahoo.com:123456789'
ployii_ruk@hotmail.com:123456789
</pre>

Result: Mysql INSERT query
<pre>
INSERT INTO leaks (email, password, collection, type) VALUES
("pantiwast@hotmail.com","123456789","Collection #1","leak"),
("paixnidiap@gmail.com","123456789","Collection #1","leak"),
("evelyne_110@live.fr","123456789","Collection #1","leak"),
("hell_aran@live.com","123456789","Collection #1","leak"),
("manuelmaina@hotmail.com","123456789[0x22]","Collection #1","leak"),
("muhtesem_yunus027@hotmail.com","123456789[0x26]","Collection #1","leak"),
("yovana_caridad_2006@hotmail.com","123456789","Collection #1","leak"),
("yous_@hotmail.it","123456789","Collection #1","leak"),
("kamron.marshall@yahoo.com","123456789[0x27]","Collection #1","leak"),
;
</pre>


Result: MongoDB json to insert
<pre>
[
 {"email": "pantiwast@hotmail.com", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "paixnidiap@gmail.com", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "evelyne_110@live.fr", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "hell_aran@live.com", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "manuelmaina@hotmail.com", "password": "123456789[0x22]", "collection": "Collection #1", "type": "leak"},
 {"email": "muhtesem_yunus027@hotmail.com", "password": "123456789[0x26]", "collection": "Collection #1", "type": "leak"},
 {"email": "yovana_caridad_2006@hotmail.com", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "yous_@hotmail.it", "password": "123456789", "collection": "Collection #1", "type": "leak"},
 {"email": "kamron.marshall@yahoo.com", "password": "123456789[0x27]", "collection": "Collection #1", "type": "leak"},
]
</pre>
