#!/bin/sh

echo '<link rel="stylesheet" type="text/css" href="<%= process.env.GROWI_URI %>/_hackmd/load-styles">' >> /hackmd/public/views/codimd/head.ejs
echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-agent" defer></script>' >> /hackmd/public/views/codimd/foot.ejs
