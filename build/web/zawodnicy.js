function validation()
    {
        var imie = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ][a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{2,20}$/;
        var nazwisko = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ][a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,25}$/;
        var data_urodz = /^((((19|20)(([02468][048])|([13579][26]))-02-29))|((20[0-1][0-4])|(19[0-9][0-9]))-((((0[1-9])|(1[0-2]))-((0[1-9])|(1\d)|(2[0-8])))|((((0[13578])|(1[02]))-31)|(((0[1,3-9])|(1[0-2]))-(29|30)))))$/;
        var miejsce_urodzenia = /^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^$/;
        var kraj = /^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^$/;
        var wystepy = /^[0-9]{1,3}$/;
        var gole = /^[0-9]{1,3}$/;
        var pozycja = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,3}$/;
        var id_klubu = /^[0-9]{1,5}$/;
        
        if (!imie.test(document.getElementById('imie').value)) // 2
        {
            alert('Podaj poprawne imię!');
            return false;
        }
        
        if (!nazwisko.test(document.getElementById('nazwisko').value)) // 2
        {
            alert('Podaj poprawne nazwisko!');
            return false;
        }
        
        if (!data_urodz.test(document.getElementById('data_urodz').value)) // 2
        {
            alert('Podaj datę urodzenia w formacie yyyy-mm-dd lub data jest starsza niż obecna!');
            return false;
        }
        
        if (!miejsce_urodzenia.test(document.getElementById('miejsce_urodzenia').value)) // 2
        {
            alert('Podaj poprawne miejsce urodzenia!');
            return false;
        }
        
        if (!kraj.test(document.getElementById('kraj').value)) // 2
        {
            alert('Podaj poprawną narodowość!');
            return false;
        }
        
        if (!wystepy.test(document.getElementById('wystepy').value)) // 2
        {
            alert('Podaj poprawną ilość występów!');
            return false;
        }
        
        if (!gole.test(document.getElementById('gole').value)) // 2
        {
            alert('Podaj poprawną ilość goli!');
            return false;
        }
        
        if (!pozycja.test(document.getElementById('pozycja').value)) // 2
        {
            alert('Podaj poprawną pozycję np. ŚO!');
            return false;
        }
        
        if (!id_klubu.test(document.getElementById('id_klubu').value)) // 2
        {
            alert('Podaj identyfikator klubu!');
            return false;
        }
        return true;
    }
