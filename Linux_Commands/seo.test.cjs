const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const {execFileSync} = require('node:child_process');

execFileSync(process.execPath, [path.join(__dirname, 'generate-static.cjs'), '--check']);
const context = vm.createContext({document: {addEventListener() {}}});
for (const file of ['data.js', 'app.js']) {
  vm.runInContext(fs.readFileSync(path.join(__dirname, file), 'utf8'), context);
}
assert.equal(vm.runInContext('COMMANDS.length', context), 361);
assert.equal(vm.runInContext('CATS.length', context), 16);
assert.equal(vm.runInContext('highlight("<script>&", "")', context), '&lt;script&gt;&amp;');
assert.equal(vm.runInContext('highlight("a.b and aXb", "a.b")', context), '<mark>a.b</mark> and aXb');
assert.equal(vm.runInContext('highlight("$& and $&", "$&")', context), '<mark>$&amp;</mark> and <mark>$&amp;</mark>');
assert.equal(vm.runInContext('usageHTML("<code>echo <target> && echo $&</code><br>")', context), '<code>echo &lt;target&gt; &amp;&amp; echo $&amp;</code><br>');
assert.equal(vm.runInContext('usageHTML("<img src=x onerror=alert(1)>")', context), '&lt;img src=x onerror=alert(1)&gt;');
const html = fs.readFileSync(path.join(__dirname, 'index.html'), 'utf8');
assert.equal((html.match(/<tbody/g) || []).length, 1);
assert.equal((html.match(/<tr>/g) || []).length, 362);
assert.ok(html.includes('id="totalCount">361</strong>'));
assert.ok(html.includes("$&#39;user anonymous"));
console.log('PASS: generated table, counts, literal search and safe command markup.');
