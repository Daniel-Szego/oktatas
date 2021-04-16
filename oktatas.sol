pragma solidity ^0.6.6;

contract Oktatas {
 
    enum OktatasTipusa {
        Tantermi,
        Online,
        Hibrid
    }
 
    // PROPERTIES
    
    // atomic types
    bool public isActiveOktatas;
    int8 public szekekSzama;
    uint8 public csakPozittivSzekekSzama;
    uint public hallgatokSzama;

    // atomic built in type
    address public targyAdminisztrator;
    
    // complex types
    string public tantargyNeve;
    OktatasTipusa public tipus;
    
    uint[] public diakigazolvanyID;

    // FUGGVENYEK
    
    // tranzakcio 
    
    constructor(uint _beiratkozok) public {
        isActiveOktatas = true;
        szekekSzama = -10;
        csakPozittivSzekekSzama = 10;
        hallgatokSzama = _beiratkozok;
        tantargyNeve = "Blockchain programozas";
        targyAdminisztrator = msg.sender;
        tipus = OktatasTipusa.Online;
    }

    function initDiakigazolvany() public {
        for (uint i = 0; i < 80 ; i++ ){
            diakigazolvanyID.push(i);
        }    
    }
    

    function getDiakigazplvanyID(uint _hanyadik) public view returns (uint) {
        return diakigazolvanyID[_hanyadik];
    }  
    
    function sumDiakigazolvanyID() public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < diakigazolvanyID.length ; i++ ){
            sum += diakigazolvanyID[i];
        }
        return sum;
    }

    function setToTantermi() public {
        tipus = OktatasTipusa.Tantermi;
    }

    function setOktatasTipus(OktatasTipusa _ujTipus) public {
        tipus = _ujTipus;
    }
    

    function changeTagyNev(string calldata _ujNev) public {
        string memory megujNev = "Halado Blockchain";
        tantargyNeve = megujNev;
    } 
    
    // tranzakcio
    function beiratas(uint _hanyUjHallgato) public {
         szekekSzama += 1;
         hallgatokSzama += _hanyUjHallgato;
         csakPozittivSzekekSzama = 22;
         tipus = OktatasTipusa.Tantermi;
    }
    
    // kiolvaso fuggveny
    function hallgatokSzekekEsTablakSzama(uint _tabla) public view returns (uint _azOsszeg, uint _tablaMegEgy) {
        _azOsszeg = _tabla + csakPozittivSzekekSzama + hallgatokSzama;
        _tablaMegEgy = _tabla + 1;
    }
    
}