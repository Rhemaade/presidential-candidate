import List "mo:base/List";


actor PresidentialRace {

  var contestants = List.nil<Contestants>();
 
 type Contestants = {
   Firstname: Text;
   Lastname: Text;
   Age: Nat;
   Nationality:Text;
   Occupation: Text;
   Gender: Gender;
 };

  type Gender = {
   #Male;
   #Female;
 };

 public query func allContestants(): async List.List<Contestants>{
    return contestants;
  };

  public query func sortByGender(Gender:Gender): async List.List<Contestants>{
    let matchedContestants = List.filter<Contestants>(
      contestants, 
      func contestants { 
        if(contestants.Gender == Gender){
          return true;
        }else{
          return false;
        }
      }
    );

  return matchedContestants;
  };

   public query func sortByNationality(Nationality:Text): async List.List<Contestants>{
    let matchedContestants = List.filter<Contestants>(
      contestants, 
      func contestants { 
        if(contestants.Nationality == Nationality){
          return true;
        }else{
          return false;
        }
      }
    );

  return matchedContestants;
  };

  public query func sortByOccupation(Occupation:Text): async List.List<Contestants>{
    let matchedContestants = List.filter<Contestants>(
      contestants, 
      func contestants { 
        if(contestants.Occupation == Occupation){
          return true;
        }else{
          return false;
        }
      }
    );

  return matchedContestants;
  };

  public query func numberOfContestants(): async Nat{
    List.size<Contestants>(contestants);
  };

  type ContestantSearch=  {
    #Success : Contestants;
    #Failure : Text;
  };

  public query func getContestant(Firstname:Text): async ContestantSearch {
    let matchedContestant = List.find<Contestants>(
      contestants, 
      func contestant { 
        if(contestant.Firstname == Firstname){
          return true;
        }else{
          return false;
        }
      }
    );

    switch(matchedContestant){
      case(null){
        return #Failure "could not find the contestant";
      };

      case(?matchedContestant){
        return #Success matchedContestant;
      }
    }

  };


  public func addContestant(contestant:Contestants): async Text {
    let newList = List.push<Contestants>(contestant,contestants);
    contestants := newList;
    return "succesfully added contestant" # " " # contestant.Firstname # contestant.Lastname
  };


  public query func eligibleContestant(): async List.List<Contestants>{  
    let standard = "Nigerian";
    let matchedContestants = List.filter<Contestants>(
      contestants, 
      func contestants { 
        if (contestants.Age >= 30 and contestants.Nationality == standard){
          return true;
        }else{
          return false;
        }
      }
    );

  return matchedContestants;

};
 
 
};