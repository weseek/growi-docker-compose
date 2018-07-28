#!/bin/sh

echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-styles"></script>' >> /hackmd/public/views/codimd/head.ejs
echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-agent" defer></script>' >> /hackmd/public/views/codimd/foot.ejs
