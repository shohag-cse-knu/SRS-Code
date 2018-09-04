function cif_numeric_check(cif)
{
    if(/[0-9]$/.test(cif)){
        if(cif.length > 9 || cif.length < 3)
        {  
            return 0;
        }else{
            return 1
        }
    }else{
        return 2;
    }
}