function validation()
    {
        var imie = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ][a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{2,20}$/;
        var nazwisko = /^[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ][a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,25}$/;
        var data_urodz = /^((((19|20)(([02468][048])|([13579][26]))-02-29))|((20[0-1][0-4])|(19[0-9][0-9]))-((((0[1-9])|(1[0-2]))-((0[1-9])|(1\d)|(2[0-8])))|((((0[13578])|(1[02]))-31)|(((0[1,3-9])|(1[0-2]))-(29|30)))))$/;
        var kraj = /^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^([A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,}\040[A-Z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1}[a-z-zóąśłżźćńÓĄŚŁŻŹĆŃ]{1,})$|^$/;
        var kont_wyg = /^((((19|20)(([02468][048])|([13579][26]))-02-29))|((203[0-9])|(20[1-9][0-9]))-((((0[1-9])|(1[0-2]))-((0[1-9])|(1\d)|(2[0-8])))|((((0[13578])|(1[02]))-31)|(((0[1,3-9])|(1[0-2]))-(29|30)))))$/;
      
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
        
        if (!kraj.test(document.getElementById('kraj').value)) // 2
        {
            alert('Podaj poprawną narodowość!');
            return false;
        }
        
        if (!kont_wyg.test(document.getElementById('kont_wyg').value)) // 2
        {
            alert('Podaj datę końcową kontraktu w formacie yyyy-mm-dd lub z rokiem większym od 2009!');
            return false;
        }
        
        return true;
    }
        