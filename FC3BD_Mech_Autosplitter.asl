//Autosplitter for far Cry 3: Blood Dragon R.G Mechanics
//By: M_E_T_A_L_I_S_T___S_P_1_D
//Based on Rekorer's Load Removal

state("fc3_blooddragon_d3d11")
{
	int passedmissions : "FC3_d3d11.dll", 0x01E57470, 0x10, 0x6C, 0x30, 0x8, 0x1C, 0x50, 0x10;
    int liberatedgarisons : "FC3_d3d11.dll", 0x01ED04B8, 0x90, 0xC, 0x220, 0x10, 0x1C, 0x50, 0x40;
    int passedhostage : "FC3_d3d11.dll", 0x05ED2D0, 0x124, 0x10, 0x1BC, 0x10, 0x21C, 0x50, 0x150;
    int passedpredator : "FC3_d3d11.dll", 0x01ED6214, 0x4, 0x8, 0x60, 0x10, 0x1C, 0x50, 0x160;
    int loading_1 : "FC3_d3d11.dll", 0x01EB2DA4, 0x40;
}

startup
{
    settings.Add("missions", true, "Split when completing a Main Mission:");
    settings.Add("mission1", true, "You Got Time To Duck?", "missions");
    settings.Add("mission2", true, "They're Hee-eere!", "missions");
    settings.Add("mission3", true, "Punch It", "missions");
    settings.Add("mission4", true, "What Is This Shit?", "missions");
    settings.Add("mission5", true, "I Don't Deal With Psychos. I Put 'Em Away", "missions");
    settings.Add("mission6", true, "Summon The Plague", "missions");
    settings.Add("mission7", false, "I Must Break You (Check rules to manually end the run)", "missions");
    settings.Add("garison", true, "Split when liberating a Garison:");
    settings.Add("garison1", false, "Garison 1", "garison");
    settings.Add("garison2", false, "Garison 2", "garison");
    settings.Add("garison3", false, "Garison 3", "garison");
    settings.Add("garison4", false, "Garison 4", "garison");
    settings.Add("garison5", false, "Garison 5", "garison");
    settings.Add("garison6", false, "Garison 6", "garison");
    settings.Add("garison7", false, "Garison 7", "garison");
    settings.Add("garison8", false, "Garison 8", "garison");
    settings.Add("garison9", false, "Garison 9", "garison");
    settings.Add("garison10", false, "Garison 10", "garison");
    settings.Add("garison11", false, "Garison 11", "garison");
    settings.Add("garison12", false, "Garison 12", "garison");
    settings.Add("garison13", false, "Garison 13", "garison");
    settings.Add("predator", true, "Split when completing Predator's Path:");
    settings.Add("predator1", false, "Predator's Path 1", "predator");
    settings.Add("predator2", false, "Predator's Path 2", "predator");
    settings.Add("predator3", false, "Predator's Path 3", "predator");
    settings.Add("predator4", false, "Predator's Path 4", "predator");
    settings.Add("predator5", false, "Predator's Path 5", "predator");
    settings.Add("predator6", false, "Predator's Path 6", "predator");
    settings.Add("predator7", false, "Predator's Path 7", "predator");
    settings.Add("predator8", false, "Predator's Path 8", "predator");
    settings.Add("hostage", true, "Split when completing Hostage Rescue:");
    settings.Add("hostage1", false, "Save A Nerd", "hostage");
    settings.Add("hostage2", false, "Hostage Rescue 2", "hostage");
    settings.Add("hostage3", false, "Hostage Rescue 3", "hostage");
    settings.Add("hostage4", false, "Hostage Rescue 4", "hostage");
    settings.Add("hostage5", false, "Hostage Rescue 5", "hostage");
    settings.Add("hostage6", false, "Hostage Rescue 6", "hostage");
    settings.Add("hostage7", false, "Hostage Rescue 7", "hostage");
    settings.Add("hostage8", false, "Hostage Rescue 8", "hostage");
    
// This is to check if you have Compare Against -> Real Time instead of Game Time
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var mbox = MessageBox.Show(
            "Removing loads from Far Cry 3: Blood Dragon requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Far Cry 3: Blood Dragon",
            MessageBoxButtons.YesNo);

        if (mbox == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

split
{
return
    current.passedmissions == old.passedmissions + 1
      && current.passedmissions > 0 && current.passedmissions < 7
      && settings["mission" + current.passedmissions]
    || current.liberatedgarisons == old.liberatedgarisons + 1
      && current.liberatedgarisons > 0 && current.liberatedgarisons < 13 && current.Loading == 0
      && settings["garison" + current.liberatedgarisons]
    || current.passedhostage == old.passedhostage + 1
      && current.passedhostage > 0 && current.passedhostage < 8 && current.Loading == 0
      && settings["hostage" + current.passedhostage]
    || current.passedpredator == old.passedpredator + 1
      && current.passedpredator > 0 && current.passedpredator < 8 && current.Loading == 0
      && settings["predator" + current.passedpredator];
}

isLoading
{
    return (current.loading_1>0);
}
