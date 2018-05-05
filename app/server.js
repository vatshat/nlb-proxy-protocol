const app = require('koa')();
const router = require('koa-router')();

// Log requests
app.use(function *(next){
  const start = new Date;
  yield next;
  const ms = new Date - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

router.get('/', function *() {	
	
	var objs = new Object();
		objs.x_forwarded_for = this.request.headers["x-forwarded-for"];
		objs.x_client_ip = this.request.headers["x-client-ip"];
		objs.x_forward_by = this.request.headers["x-forwarded-by"];
		objs.x_forward_proto = this.request.headers["x-forwarded-proto"];
		objs.x_test_ip = this.request.headers["x-test-ip"];
		objs.x_ssl_cipher = this.request.headers["x-ssl-cipher"];
		objs.x_ssl_protocol = this.request.headers["x-ssl-protocol"];
		objs.x_ssl_session_id = this.request.headers["x-ssl-session_id"];
		objs.x_ssl_issuer = this.request.headers["x-ssl-issuer"];
			
	this.body = JSON.stringify(objs);
});

router.get('/health-check', function *() {
  this.body = 'Healthy';
});

app.use(router.routes());
app.use(router.allowedMethods());

app.listen(8080);

console.log('Application ready and running...');