#!/bin/sh

echo '<script src="<%= process.env.GROWI_URI %>/_hackmd/load-agent"></script>' >> /hackmd/public/views/codimd/head.ejs
