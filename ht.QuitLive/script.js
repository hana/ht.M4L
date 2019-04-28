const Max = require('max-api');
const exec = require('child_process').exec;

let version = 10; 
let save = 0;


Max.addHandler("version", (v) => {
	version = v;
})

Max.addHandler("save", (s) => {
	save = s;
})

Max.addHandler("bang", () => {
	invoke(version, save);
});


function invoke(version, save) {
	exec(`osascript lib/QuitLive.scpt ${version} ${save}`, (err, stdout, stderr) => {
  		if (err) { console.log(err); }
  		Max.post(stdout);
	});
}