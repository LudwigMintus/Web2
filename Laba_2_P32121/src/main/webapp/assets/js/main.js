form = document.querySelector("#forma_data")
//Обработка запроса
let Storage = [];
let circles = document.querySelector('.circles');
form.addEventListener("submit", (e)=> {

    let element_y = document.getElementById('YInput')
    let element_x = document.querySelector('.x');
    let element_r = document.getElementById('RSelect');
    let value_of_element = element_y.value
    let int_value_y = parseInt(value_of_element)

    if(isNaN(int_value_y) || int_value_y<-5 || int_value_y>3) {
        document.querySelector('.leftChart').innerHTML =
            `
                <a>Вы ввели не коректные значения для Y (-5,3)</a>
                `
        e.preventDefault()
        return false
    }
})
let svg = document.querySelector('.svg')
let square = document.querySelector('.square')
let circle = document.querySelector('.circle')
//let triangle = document.querySelector('.triangle')

console.log(svg)
console.log(square)
console.log(circle)
svg.onclick = function(event) {
    let r = Math.round(circle.getBoundingClientRect().x) - Math.round(square.getBoundingClientRect().x);
    let x = event.clientX - Math.round(circle.getBoundingClientRect().x);
    let y = Math.round(circle.getBoundingClientRect().y) - event.clientY;
    let rValue = document.getElementById('RSelect').value;
    let xValue = (rValue * x / r)/2;
    let yValue = (rValue * y / r)/2;
    let circles = document.querySelector('.circles');
    let cx = 150 + xValue * 100 / rValue;
    let cy = 150 - yValue * 100 / rValue;
    if(hit(xValue,yValue,rValue)) color="green";
    else color=`red`
    let Lcircle = `<circle r="${2}" cx="${cx}" cy="${cy}" fill="${color}"></circle>`;
    circles.innerHTML += Lcircle;
    Storage.push(Lcircle);
    localStorage.setItem('Answer', JSON.stringify(Storage));
    document.getElementById('YInput').value = yValue;
    document.getElementById('RSelect').value = rValue;
    document.querySelector('#x_value_0').value = xValue;
    document.querySelector('#x_value_0').checked = true;
    document.getElementById('verify').click();
    document.querySelector('#x_value_0').value = 0;
}
function hit(x,y,r){
    if (x > 0 && y > 0) {
        return false;
    } else if (x <= 0 && y > 0 && (y < x + r/2)) {
        return true
    } else if (x >= 0 && y <= 0 && (y >= -Math.sqrt((r / 2) * (r / 2)  - x * x))){
        return true;
    } else if (x <= 0 && y <= 0 && (x >= -r/2 && y >= -r)) {
        return true;
    }
}
function paint(){
    Storage = [];
    let newMatrix = JSON.parse(localStorage.getItem('Answer'))
    for (let i = 0; i< newMatrix.length ; i++) {
        Storage.push(newMatrix[i]);
    }
    for (let i = 0; i< Storage.length ; i++) {
        circles.innerHTML += Storage[i];
    }
}
paint();






