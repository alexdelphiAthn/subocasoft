unit inLibUser;

interface

uses Windows;



var
  oUser           :WideString;
  oGroup          :WideString;
  oUbiModif       :WideString;
  oCaps           :WideString;
  oVersion        :WideString;
  oComputer       :WideString;

implementation

uses inLibDir, inLibWin;


initialization
  oUbiModif        := '1';
  oCaps            := 'N';
  oVersion         := '0.0.0.0';
  //oComputer        := ComputerName;
  oUser            := 'Programmer'
end.

