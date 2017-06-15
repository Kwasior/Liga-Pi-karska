function validation()
    {
        var nklubu = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ][a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{2,20}$/;
        var strona_www = /^((https?):\/\/)?([w|W]{3}\.)+[a-zA-Z0-9\-\.]{3,}\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$/;
        var miasto = /^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^$/;
        var mistrz = /^[0-9]{1,2}$/;
        var puchar = /^[0-9]{1,2}$/;
        var id_stadionu = /^[0-9]{1,5}$/;
        var id_trenera = /^[0-9]{1,5}$/;
                
        if (!nklubu.test(document.getElementById('nklubu').value)) // 2
        {
            alert('Podaj poprawną nazwę klubu!');
            return false;
        }
        
        if (!strona_www.test(document.getElementById('strona_www').value)) // 2
        {
            alert('Podaj poprawną stronę internetową!');
            return false;
        }
        
        if (!miasto.test(document.getElementById('miasto').value)) // 2
        {
            alert('Podaj poprawną nazwę miasta!');
            return false;
        }
        
        if (!mistrz.test(document.getElementById('mistrz').value)) // 2
        {
            alert('Podaj poprawną ilość mistrzostw!');
            return false;
        }
        
        if (!puchar.test(document.getElementById('puchar').value)) // 2
        {
            alert('Podaj poprawną ilość pucharów!');
            return false;
        }
        
        if (!id_stadionu.test(document.getElementById('id_stadionu').value)) // 2
        {
            alert('Podaj poprawny identyfikator stadionu!');
            return false;
        }
        
        if (!id_trenera.test(document.getElementById('id_trenera').value)) // 2
        {
            alert('Podaj poprawny identyfikator trenera!');
            return false;
        }
        
        return true;
    }
