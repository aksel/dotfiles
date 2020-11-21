#!/bin/node

`use strict`

const { exec } = require('child_process');

exec('nordvpn status', (err, stdout, stderr) => {
  if (err) {
    return;
  }

  const connected = !/disconnected/i.exec(stdout);

  if (connected) {
    const [country] = stdout.match(/(?<=Country: ).*/);
    console.log("VPN: " + country);
  } else {
    console.log("<span font_desc='FontAwesome'></span> VPN disconnected");
  }
});
