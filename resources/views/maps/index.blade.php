<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
            integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
            crossorigin=""/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>Humedad de las ciudades</title>
        <link rel="stylesheet" href="{{ asset('css/global.css') }}">
    </head>
    <body>
        <header>
            <div class="container">
                <h2 class="pb-3 pt-3 mb-0">Humedad de las ciudades</h2>
            </div>
        </header>
        <div class="container">
            <section class="pb-3 pt-3">
                <div id="map"></div>
            </section>
            <div class="mb-3" style="text-align: center;">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#historialModal">
                    Consultar Historial
                </button>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="historialModal" tabindex="-1" aria-labelledby="historialModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Historial</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h3>Registro de historial</h3>
                        <div style="overflow-x:auto;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Ciudad</th>
                                        <th>Humedad</th>
                                        <th>Hora consulta</th>
                                    </tr>
                                </thead>
                                <tbody id="data_historial"></tbody>
                            </table>
                          </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
            integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
            crossorigin=""></script>
    <script src="{{ asset('js/map.js') }}"></script>
    <script>
        let ciudades = @JSON($ciudades);
        let cities = [];
        let humedad = 0;
        for(city of ciudades){
            humedad = llamadoApiHumedad(city, parseFloat(city.latitud), parseFloat(city.longitud));
        }

        setTimeout(() => {
            pintarMapa(cities);
            guardarHistorial(cities);
        }, 3000);

        let guardarHistorial = (cities) =>{
            let data = {
                'cities': cities,
            }
            
            fetch("{{ route('guardar_historial') }}", {
                headers:{
                 'Content-Type': 'application/json',
                 'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                method:'POST',
                body: JSON.stringify(data)
            }).then(response => response.json())
            .then(function(result){
                console.log(result);
            })
            .catch(function (error) {
                console.log(error);
            });
        }
        let consultarHistorial = () => {
            fetch('{{ route("historial") }}')
            .then(response => response.json())
            .then(response => {
                pintarTabla(response, "data_historial");
            });

        }
        $('#historialModal').on('show.bs.modal', function (e) {
            consultarHistorial();
        })
    </script>
</html>
