function GetInfo(infoObject) {
    infoObject.Name = "iOS Client (Matchbox Mobile)";
    infoObject.Description = "To convert a profile into a iOS helper file";
    infoObject.Author = "Matchbox Mobile";
    infoObject.Version = "1.0";
    infoObject.IsClient = true;
    return infoObject;
}

function RunPlugin(profileData) {
    var mainTemplate = FileManager.ReadFile("CharacteristicHelper.m.tmpl");
    mainTemplate = ProcessTemplate(mainTemplate, profileData);
    FileManager.CreateFile("CharacteristicHelper.m", mainTemplate);
}



