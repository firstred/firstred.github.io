<pre><code class="apache apacheconf hljs">&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs&quot;&gt;

&lt;IfModule mod_rewrite.c&gt;
# PrestaShop current domain: '{{main_store.domain}}'

RewriteEngine on
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule . - [E=REWRITEBASE:{{main_store.dir}}]
RewriteRule ^api/?(.*)$ %{ENV:REWRITEBASE}webservice/dispatcher.php?url=$1 [QSA,L]

{{#multistores}}
{{#dir}}
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^{{dir}}$ / [L,R]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^{{dir}}/(.*) /$1 [L]
{{/dir}}
{{/multistores}}
{{#main_store.dir}}
RewriteCond %{HTTP_HOST} ^{{main_store.dir}}$
RewriteRule ^{{dir}}$ / [L,R]
RewriteCond %{HTTP_HOST} ^{{main_store.dir}}$
RewriteRule ^{{dir}}/(.*) /$1 [L]
{{/main_store.dir}}

# Images
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$1$2$3$4.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$1$2$3$4$5.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$1$2$3$4$5$6.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$1$2$3$4$5$6$7.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$1$2$3$4$5$6$7$8.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$7/$1$2$3$4$5$6$7$8$9.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$7/$8/$1$2$3$4$5$6$7$8$9$10.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^c/([0-9]+)(\-[\.*_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/c/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^c/([a-zA-Z_-]+)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/c/$1$2.jpg [L]
# AlphaImageLoader for IE and fancybox
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^images_ie/?([^/]+)\.(jpe?g|png|gif)$ js/jquery/plugins/fancybox/images/$1.$2 [L]

# Dispatcher
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^.*$ - [NC,L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}$
RewriteRule ^.*$ %{ENV:REWRITEBASE}index.php [NC,L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
##RewriteRule . - [E=REWRITEBASE:/prestashop/]
RewriteRule ^api/?(.*)$ %{ENV:REWRITEBASE}webservice/dispatcher.php?url=$1 [QSA,L]

# Images
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$1$2$3$4.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$1$2$3$4$5.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$1$2$3$4$5$6.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$1$2$3$4$5$6$7.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$1$2$3$4$5$6$7$8.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$7/$1$2$3$4$5$6$7$8$9.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/p/$1/$2/$3/$4/$5/$6/$7/$8/$1$2$3$4$5$6$7$8$9$10.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^c/([0-9]+)(\-[\.*_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/c/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^c/([a-zA-Z_-]+)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE}img/c/$1$2.jpg [L]
# AlphaImageLoader for IE and fancybox
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^images_ie/?([^/]+)\.(jpe?g|png|gif)$ js/jquery/plugins/fancybox/images/$1.$2 [L]

# Dispatcher
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^.*$ - [NC,L]
RewriteCond %{HTTP_HOST} ^{{main_store.domain}}:443$
RewriteRule ^.*$ %{ENV:REWRITEBASE}index.php [NC,L]
{{#multistores}}RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule . - [E=REWRITEBASE{{index}}:]
RewriteRule ^api/?(.*)$ %{ENV:REWRITEBASE{{index}}}webservice/dispatcher.php?url=$1 [QSA,L]

# Images
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$1$2$3$4.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$1$2$3$4$5.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$1$2$3$4$5$6.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$1$2$3$4$5$6$7.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$1$2$3$4$5$6$7$8.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$7/$1$2$3$4$5$6$7$8$9.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$7/$8/$1$2$3$4$5$6$7$8$9$10.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^c/([0-9]+)(\-[\.*_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/c/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^c/([a-zA-Z_-]+)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/c/$1$2.jpg [L]
# AlphaImageLoader for IE and fancybox
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^images_ie/?([^/]+)\.(jpe?g|png|gif)$ js/jquery/plugins/fancybox/images/$1.$2 [L]

# Dispatcher
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^.*$ - [NC,L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^.*$ %{ENV:REWRITEBASE{{index}}}index.php [NC,L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule . - [E=REWRITEBASE{{index}}:]
RewriteRule ^api/?(.*)$ %{ENV:REWRITEBASE{{index}}}webservice/dispatcher.php?url=$1 [QSA,L]

# Images
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}$
RewriteRule ^([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$1$2$3$4.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$1$2$3$4$5.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$1$2$3$4$5$6.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$1$2$3$4$5$6$7.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$1$2$3$4$5$6$7$8.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$7/$1$2$3$4$5$6$7$8$9.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])([0-9])(\-[_a-zA-Z0-9-]*)?(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/p/$1/$2/$3/$4/$5/$6/$7/$8/$1$2$3$4$5$6$7$8$9$10.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^c/([0-9]+)(\-[\.*_a-zA-Z0-9-]*)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/c/$1$2$3.jpg [L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^c/([a-zA-Z_-]+)(-[0-9]+)?/.+\.jpg$ %{ENV:REWRITEBASE{{index}}}img/c/$1$2.jpg [L]
# AlphaImageLoader for IE and fancybox
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^images_ie/?([^/]+)\.(jpe?g|png|gif)$ js/jquery/plugins/fancybox/images/$1.$2 [L]

# Dispatcher
RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^.*$ - [NC,L]
RewriteCond %{HTTP_HOST} ^{{domain}}:443$
RewriteRule ^.*$ %{ENV:REWRITEBASE{{index}}}index.php [NC,L]
{{/multistores}}

&lt;/IfModule&gt;

&lt;IfModule mod_expires.c&gt;
	  ExpiresActive On
	  ExpiresByType image/gif &quot;access plus 1 month&quot;
	  ExpiresByType image/jpeg &quot;access plus 1 month&quot;
	  ExpiresByType image/png &quot;access plus 1 month&quot;
	  ExpiresByType text/css &quot;access plus 1 week&quot;
	  ExpiresByType text/javascript &quot;access plus 1 week&quot;
	  ExpiresByType application/javascript &quot;access plus 1 week&quot;
	  ExpiresByType application/x-javascript &quot;access plus 1 week&quot;
	  ExpiresByType image/x-icon &quot;access plus 1 year&quot;
      ExpiresByType image/svg+xml &quot;access plus 1 year&quot;
      ExpiresByType image/vnd.microsoft.icon &quot;access plus 1 year&quot;
      ExpiresByType application/font-woff &quot;access plus 1 year&quot;
      ExpiresByType application/x-font-woff &quot;access plus 1 year&quot;
      ExpiresByType application/vnd.ms-fontobject &quot;access plus 1 year&quot;
      ExpiresByType font/opentype &quot;access plus 1 year&quot;
      ExpiresByType font/ttf &quot;access plus 1 year&quot;
      ExpiresByType font/otf &quot;access plus 1 year&quot;
      ExpiresByType application/x-font-ttf &quot;access plus 1 year&quot;
      ExpiresByType application/x-font-otf &quot;access plus 1 year&quot;
&lt;/IfModule&gt;

FileETag INode MTime Size
&lt;IfModule mod_deflate.c&gt;
	  &lt;IfModule mod_filter.c&gt;
	  	    AddOutputFilterByType DEFLATE text/html text/css text/javascript application/javascript application/x-javascript
		    &lt;/IfModule&gt;
&lt;/IfModule&gt;

#If rewrite mod isn't enabled
ErrorDocument 404 /index.php?controller=404



&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/administration/backups&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/administration/export&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/administration/import&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/administration/tabs&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/classes&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/config&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/config/xml&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/css&quot;&gt;
&lt;IfModule mod_rewrite.c&gt;
	RewriteEngine on
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteRule &quot;(.*)\.css$&quot; retro-compat.css.php?file=$1.css [QSA,L]
&lt;/IfModule&gt;



&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/docs&quot;&gt;
Deny from ALL

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/docs/csv_import&quot;&gt;
Allow from ALL
&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/download&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/img/cms&quot;&gt;
&lt;IfModule mod_php5.c&gt;
	php_flag engine off
&lt;/IfModule&gt;
deny from all
&lt;Files ~ &quot;(?i)^.*\.(jpg|jpeg|gif|png|bmp|tiff|svg|pdf|mov|mpeg|mp4|avi|mpg|wma|flv|webm)$&quot;&gt;
	order deny,allow
	allow from all
&lt;/Files&gt;

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/install/sandbox&quot;&gt;
&lt;IfModule mod_env.c&gt;
	SetEnv HTTP_MOD_REWRITE On
&lt;/IfModule&gt;
&lt;IfModule mod_rewrite.c&gt;
	RewriteEngine on
	RewriteRule ^.*$ test.php
&lt;/IfModule&gt;

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/js&quot;&gt;
&lt;IfModule mod_rewrite.c&gt;
	RewriteEngine on
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteRule &quot;([^/]*)\.js$&quot; retro-compat.js.php?file=$1.js [QSA,L]
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteRule &quot;([^/]*)\.css$&quot; ../css/retro-compat.css.php?file=$1.css [QSA,L]
&lt;/IfModule&gt;



&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/log&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/modules&quot;&gt;
&lt;FilesMatch &quot;\.tpl$&quot;&gt;
Deny from all
&lt;/FilesMatch&gt;

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/override&quot;&gt;
Order deny,allow
Deny from all
&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/pdf&quot;&gt;
&lt;FilesMatch &quot;\.tpl$&quot;&gt;
Deny from all
&lt;/FilesMatch&gt;
&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/themes&quot;&gt;
&lt;FilesMatch &quot;\.tpl$&quot;&gt;
Deny from all
&lt;/FilesMatch&gt;
&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools&quot;&gt;
&lt;IfModule mod_rewrite.c&gt;
RewriteEngine on

RewriteCond %{REQUEST_FILENAME} -s [OR]
RewriteCond %{REQUEST_FILENAME} -l [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^.*$ - [NC,L]
RewriteRule ^.*$ ../index.php [NC,L]
&lt;/IfModule&gt;

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/geoip&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/htmlpurifier&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/http_build_url&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/js_minify&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/json&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/minify_html&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/mobile_Detect&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/parser_sql&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/pclzip&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/pear&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/pear_xml_parser&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/profiling&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/smarty&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/swift&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/tar&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/tools/tcpdf&quot;&gt;
Order deny,allow
Deny from all

&lt;/Directory&gt;
&lt;Directory &quot;/opt/bitnami/apps/prestashop/htdocs/upload&quot;&gt;
&lt;IfModule mod_mime.c&gt;
	RemoveHandler .php .phtml .php3 .php4 .php5
	RemoveType .php .phtml .php3 .php4 .php5
&lt;/IfModule&gt;
&lt;IfModule mod_php5.c&gt;
	php_flag engine off
&lt;/IfModule&gt;

&lt;/Directory&gt;
</code></pre>