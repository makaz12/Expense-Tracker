//send the data using the Fetch API
fetch('https://jsonplaceholder.typicode.com/posts', {​

    method: 'POST',
    headers: {​ 'Content-Type': 'application/x-www-form-urlencoded'​

            },​

    body: urlString //URL-encoded string​

})​

.then(response => response.json()) //Expecting JSON response​

.then(data => {​

    document.getElementById('response').innerText = `Message sent successfully! Server Response:​

    ${JSON.stringify(data)}`;​

    //json.stringify turns js objects into serial data​

})​

.catch(error => { //iff it fails, we document an error so the user knows that it did not work
document.getElementById('response').innerText = 'An error occurred.';
console.error('Error:', error);​

});​