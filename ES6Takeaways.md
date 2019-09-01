**ES6-Takeaways**

	ES6 in Motion
	Wes Higbee
	Course duration: 7h 15m
	127 exercises
	- https://www.manning.com/livevideo/es6-in-motion
	- https://github.com/g0t4/es6-in-motion
	- https://git.io/v68XM

HISTORY
=======

	ECMA = European Computer Manufacturers Association
	ES6 == ES2015


ARROW FUNCTIONS
===============

	alt:
	function getCost(order) {
		return order.price * order.quantity;
	}

	neu:
	order => order.price * order.quantity

	o => o.price * o.quantity


	Beispiel:
	alt:
	var prices = [1.1, 2.32, 3.68, 4.90];
	var taxRate = 0.07;

	var pricesWithTax = [];

	for(var i = 0; i < prices.length; i++){
		var price = prices[i];
		var tax = price * taxRate;
		pricesWithTax.push(price + tax);
	}

	console.log(pricesWithTax);


	neu:
	var pricesWithTaxMapped = prices.map(p => p + p*taxRate)

	console.log(pricesWithTaxMapped);


THIS
====

In arrow functions funktioniert this wie erwartet (lexical binding).


BLOCK SCOPING
=============

- const numbers = [1,2,3,4,5] :  => Wert bei Deklaration zuweisen
- let sum
- var version : => Global -> vermeiden!

	function asUsed(){
	  const numbers = [1.00, 2.07, 3.05];

	  let sum = 0;
	  for (let index = 0; index < numbers.length; index++) {
	    sum += numbers[index];
	  }


	  const average = sum / numbers.length;
	  const result = {
	    average: average,
	    sum: sum
	  }
	  console.log("The average price is: " + average.toFixed(2));

	  result.average = 1;
	}
	asUsed();


STRINGS
=======

- multiline strings : => ``, keine \n nötig
- string interpolation : ${n}
- tagged template strings : 
- raw strings : String.raw`Hi\n${2+3}!`; // "Hi\\n5!" // length = 6

	alt:
		let html = "" +
		  "<h2>" +
		  "  Application Settings" +
		  "</h2>" +
		  "<h3>" +
		  "  Please pick a font size:" +
		  "<h3>" +
		  "<ul>";

		for (let number = 1; number < 5; number++) {

		  let size = `${number * 100}%`;

		  html += "" +
		    "<button onclick=\"setSize('" + size + "');\">" +
		    "#" + number + " - " + size +
		    "</button>";

		}

		html += "</ul>";

	neu:
		const html = `
			<h2>
			  Application Settings
			</h2>

			<h3>
			  Please pick a font size:
			<h3>
			<ul>
			${ [1, 2, 3, 4].map(createButtonHtml).join("") }
			</ul>`;


		function createButtonHtml(number) {
		  const size = `${number * 100}%`;

		  return `
			<li>
			<button onclick="setSize('${size}');">
			  #${number} - ${size}
			</button>
			</li>
			`;
		}


DESTRUCTURING
=============

- pattern matching mit Objekten und Arrays: let one, three; [one,,three] = [1,2,3,4];
- ...rest : Rest-Parameter

	alt:
		function request(parameters){
		  console.log(parameters.url);
		  console.log(parameters.method);
		}
		request({ url: "http://www.google.com", method: "GET" });

	neu:
		function requestNew({ url, method, body }){
		  console.log(url);
		  console.log(method);
		}
		requestNew({ url: "http://www.google.com", method: "GET" });

	Beispiel:
		function computeTax(taxRate, ...prices){
		  return prices.map(p => p * taxRate);
		}

		computeTax(0.07, 1.00, 2.00, 3.00)
		//  [0.07, 0.14, 0.21000000000000002]


DEFAULTS
========

- Parameter mit Übergabe Default-Wert : function blabla ( width = 0, height = 0 ) { width * height }

	Beispiel:
	const numbers = [1,2,3,undefined,4,5]
	const cleanedNumbers = numbers.map((n = 0) => n)


ITERATION
=========

- for int, for-in, for-of (neu in ES6)
- Set (neu in ES6)
- Iterable Protocol, Iterator Protocol


const orders = [
  {desc: "Pencils", price: 1.50, quantity: 2},
  {desc: "Notepads", price: 6.00, quantity: 3},
  {desc: "Paperclips", price: 4.30}
];

for (let i=0; i<orders.length; i++) {console.log(orders[i])}
for (const order in orders) {console.log(order)}
for (const order of orders) {console.log(order)}

// const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
function positiveNumbersUpTo(stop) {
  const iterable = {
    [Symbol.iterator](){
      // return iterator
      let current = 1;
      return {
      	next() {
      		if (stop < current) {
      			return {done: true}
      		}
      		return {done: false, value: current++}
      	}
      }

    }
  };
  return iterable;
}

const numbers = [...positiveNumbersUpTo(9)];
console.log(numbers);


GENERATOR
=========

- syntactic sugar für iterator
- function*
- yield : mehrere return values

// const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
function* positiveNumbersUpTo(stop) {
    let current = 1;
    while (current <= stop)
    	yield current++;
}

const numbers = [...positiveNumbersUpTo(9)];
console.log(numbers);


PROMISES
========

- asynchron (web requests, geolocation, setTimeout...)
- ersetzen callbacks, die schwer lesbar sind
- fetch-API : const promise = fetch(weburl);
- promise.then(callbackFunction);

setTimeout(function() {
  console.log("after delay")
}, 1000);

-Beispiel
	const museumsDatasetUrl = "../../datasets/museums.json";
	const requestPromise = fetch(museumsDatasetUrl);

	requestPromise.then(function (response) {
	  const parsePromise = response.json();
	  parsePromise.then(function (museums) {
	    console.log(museums);
	  });
	  console.log(response);
	});

- besser:
	const museumsDatasetUrl = "../../datasets/museums.json";

	fetch(museumsDatasetUrl)
		.then(response => response.json())
		.then(museums => console.log(museums))
		// errors wird ausgeführt wenn irgendwo ein Fehler auftritt
		.catch(error => console.log("oh no ", error));



CLASSES
=======

- syntactical sugar over JavaScripts existing prototype-based inheritance
- Definition muss vor Instantiierung stehen (Hoisting)
- public fields: height = 0;
- private fields: #width = 0;
- extend mit super
- statsche Funktionen mit static

class Rectangle {
  height = 0;
  #width = 0;

  constructor(height, width) {
    this.height = height;
    this.#width = width || height; // Quadrat
  }
  // Method
  calcArea() {
    return this.height * this.#width;
  }

  // Static
  static name() {
  	return "Rechteck oder Quadrat"
  }
}

let rect = new Rectangle(15, 20);
console.log(rect.calcArea());
console.log(rect.height);
console.log(rect.width);
console.log(Rectangle.name());

- extend:
class Animal {
  constructor(name) {
    this.name = name;
  }
}

class Dog extends Animal {
  constructor(name) {
    super(name); // call the super class constructor and pass in the name parameter
  }
}