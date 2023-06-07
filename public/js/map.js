let llamadoApiHumedad = (city, lat, long) => {
    let humedad = 0;
    fetch(
        `https://api.openweathermap.org/data/3.0/onecall?lat=${lat}&lon=${long}&exclude=minutely,hourly&appid=2065d41ca4719976955e5523d27c4364`)
        .then(response => response.json())
        .then(response => {
            humedad = response.current.humidity;
        });

        setTimeout(() => {
            cities.push({
                id: city.id,
                nombre: city.nombre, 
                latitud: city.latitud, 
                longitud:city.longitud, 
                humedad: humedad 
            });
            return humedad;
        }, 3000);
}

let pintarMapa = (cities) => {
    let map = L.map('map').setView([parseFloat(cities[0].latitud), parseFloat(cities[0].longitud)], 6);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    for(city of cities){
        let marker = L.marker([parseFloat(city.latitud), parseFloat(city.longitud)]).addTo(map);
        marker.bindPopup(`${city.nombre}: Humedad: ${city["humedad"]} %`);
    }
}

let pintarTabla = (data, idTable) => {
    let table = $(`#${idTable}`);
    table.empty();
    for(let i=0;i< data.data.length; i++){
        console.log(data.data[i]);
        let tr = document.createElement('tr');
        
        let td1 = document.createElement('td');
        let td2 = document.createElement('td');
        let td3 = document.createElement('td');

        td1.innerHTML = data.data[i].nombre_ciudad;
        td2.innerHTML = data.data[i].humedad;
        td3.innerHTML = data.data[i].dia;

        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        table.append(tr);
    }
}