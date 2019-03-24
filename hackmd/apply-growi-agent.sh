#!/bin/sh

echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-styles"></script>' >> /codimd/public/views/codimd/head.ejs
echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-agent" defer></script>' >> /codimd/public/views/codimd/foot.ejs
