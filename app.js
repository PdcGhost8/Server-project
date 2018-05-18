/*
in terminal 

$npm install mysql

$ ls
app.js
terminal end
notes
SOA 
APPs     ->rest api->       API us      -> database
consumer ->	buffer -> used by devolpers -> hold data     
helps protect data
secure

more notes


*/
var sql = require ("mysql"); //similar in import for html

var con = mysql.createConnection({//connection
	host: "localhost", //numbers here // example 127.0.0.1:80 IP address
	user: "root", // anything in place of root
	pasword: "Oldsch00l",
	database:"doug"				//put into database
});

con.connection(function(err){
	if (err) {
		console.log("Error Connecting");
		return;
	}
	console.log("Connection Established");		
});

var idNumba = '3 or 1=1'; // hacking
con.query('select id,name,location From Employees where id =' + idNumba, function(err,rows){ //example of mysql injection shows all entries
	if (err) {
	throw err;}

		console.log("We got the data: ");
		console.log(rows); //spits out data
});
				//select				what to do when gets that data
con.query('select* From Employees', function(err,rows){
	if (err) {
	throw err;}

		console.log("We got the data: ");
		console.log(rows); //spits out data
});

var employee = {name: "John", location: "USA"};
con.query('INSERT INTO employees SET ?', employee, function (err,res){
	if (err) {
		throw err;
	}
	console.log('Last insert ID:' ,response.insertID);
	console.log('RES:',res);
	});
	
con.end(function(err){//end connection to database
	console.log("connection terminated");
});
 
