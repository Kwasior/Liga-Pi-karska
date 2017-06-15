function validation()
    {
        var msiedzace = /^[0-9]{1,5}$/;
        var mstojace = /^[0-9]{1,5}$/;
        
        if (!msiedzace.test(document.getElementById('msiedzace').value)) // 2
        {
            alert('Podaj poprawną ilość miejsc siedzących!');
            return false;
        }
        
        if (!mstojace.test(document.getElementById('mstojace').value)) // 2
        {
            alert('Podaj poprawną ilość miejsc stojących!');
            return false;
        }
        
       return true;
    }
