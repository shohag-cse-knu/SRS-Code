function cif_CB_numeric_check(var_cif)
{
    if(var_cif.startsWith("CB") == true || var_cif.startsWith("cb") == true){
        int_cif = var_cif.slice(2,var_cif.length);
        if((/[0-9]$/.test(int_cif)) && int_cif.length == 7)
        {
            return 1;
        }else{
            return 0;
        }
    }else{
        return 2; 
    }
}