const fs = require('fs');

let ymlF = fs.readFileSync('_config.yml').toString();

let theme = /^theme: .+$/m.exec(ymlF)[0].substr(7);
console.log(theme);
let package = JSON.parse(fs.readFileSync('package.json').toString());
let themeP = JSON.parse(fs.readFileSync(`themes/${theme}/package.json`).toString());
Object.assign(package.dependencies, themeP.dependencies);
fs.writeFileSync('package.json', JSON.stringify(package, null, '  '));
