//
//  C++_Logic.cpp
//  Rockgame
//
//  Created by Aniket Bane on 11/02/24.
//

#include "C++_Logic.hpp"

#include <iostream>
#include <cstdlib>
#include <ctime>


namespace localFunctions {
string compSelection[] = {"stone", "paper", "scissor"};

string randomComp() {
    return compSelection[rand() % 3];
}
}

// MARK: - Logic

string Computer::playComputer(string userSelection) {
    transform(userSelection.begin(), userSelection.end(), userSelection.begin(), ::tolower);
    string compSelectionSingle = localFunctions::randomComp();
    string result;

    if (userSelection == compSelectionSingle) {
        result = "Oh dear! You both made the same guess; try again!";
    } else if ((userSelection == "scissor" && compSelectionSingle == "paper") ||
               (userSelection == "paper" && compSelectionSingle == "stone") ||
               (userSelection == "stone" && compSelectionSingle == "scissor")) {
        result = "We regret. This time, computer won.";
    } else if ((userSelection == "scissor" && compSelectionSingle == "stone") ||
               (userSelection == "paper" && compSelectionSingle == "scissor") ||
               (userSelection == "stone" && compSelectionSingle == "paper")) {
        result = "You win for having the right guess.";
    } else {
        result = "";
    }

    return result;
}
