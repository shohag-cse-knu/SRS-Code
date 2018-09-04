var min = 2012,
    max = 2021,
    select = document.getElementById('selectElementId');
for (var i = min; i<=max; i++){
    var opt = document.createElement('option');
    opt.value = i;
    opt.innerHTML = i;
    select.appendChild(opt);
}

select.value = new Date().getFullYear();


<select id="selectElementId"></select>