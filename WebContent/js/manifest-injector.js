(function (w, m, p, f, r, o, n, t) {

  'use strict';

  f = w.createElement('a');
  f.href = w.getElementById(m).src;

  r = {};
  o = f.search.substr(1).split('&');

  while (o.length) {
    var s = o.pop().split('=');
    var k = s[0];
    var v = s[1] && decodeURIComponent(s[1]);

    if (!Object.prototype.hasOwnProperty.call(r, k)) { r[k] = v; }
  }

  n = (r.mfver || 'latest');
  t = [];
  // 호환되지 않는 브라우저 버전으로 인해 프로토콜 명시 부분 제거
  // t.push(f.protocol + '//');
  t.push('//');
  t.push(f.host);
  t.push(p.replace('[mfver]', n));
  (n === 'latest') && t.push('?ver=' + (new Date).getTime());

  w.write('<script src="' + t.join('') + '"><\/script>');

}(document, 'manifest-injector', '/dist/manifest/manifest-injector-[mfver].js'));