fetch('https://sistema.companycacel.com/Main/getAll/age', {
    method: "GET",
    headers: { 
      "periodo": "2023-03",
      "Authorization": "Basic YWRtaW5AY29tcGFueWNhY2VsLmNvbTpxd2VydA==",
      "gcl_id": "1",
      "alm_id": "1"
    }
  })
    .then(r => r.json())
    .then(r => {
      console.log(r)
    })

    fetch('http://localhost/sistema/Main/getAll/age', {
    method: "GET",
    headers: { 
      "periodo": "2023-03",
      "Authorization": "Basic YWRtaW5AY29tcGFueWNhY2VsLmNvbTpxd2VydA==",
      "gcl_id": "1",
      "alm_id": "1"
    }
  })
    .then(r => r.json())
    .then(r => {
      console.log(r)
    })