document.addEventListener("DOMContentLoaded", function () {
  // Your code here
  pre_edit();
});
const VoCanimals = {
  Lady: {
    animalid: 1,
    name: "Lady",
    owner_id: 1,
    ensured: true,
    for_adoption: false,
    belongs_to_vet: false,
    created_at: "time",
    updated_at: "time2",
    medical_history: 1,
  },
  Romina: {
    animalid: 2,
    name: "Romina",
    owner_id: 1,
    ensured: true,
    for_adoption: false,
    belongs_to_vet: false,
    created_at: "time",
    updated_at: "time2",
    medical_history: 2,
  },
};

interface iNew_Animal {

   name: string;
   owner_id: number;
   ensured: boolean;
   for_adoption: boolean;
   belongs_to_vet: boolean;
  created_at: string;
   updated_at: any;
   medical_history: number;
 
}



class cAnimal  {
  protected animalid: number;
  public name: string;
  public  owner_id: number;
 public ensured: boolean;
  public for_adoption: boolean;
  public belongs_to_vet: boolean;
 public created_at: string;
  public updated_at: any;
  //when PDO last two come from DB
  public medical_history: number;

  constructor(
    animalid: number,
    name: string,
    owner_id: number,
    ensured: boolean,
    for_adoption: boolean,
    belongs_to_vet: boolean,
    created_at: string,
    medical_history: number,
    ...rest: String[]
  ) {
    this.animalid = animalid;
    this.name = name;
    this.owner_id = owner_id;
    this.ensured = ensured;
    this.for_adoption = for_adoption;
    this.belongs_to_vet = belongs_to_vet;
    this.created_at = created_at;
    this.updated_at = this.current_time();
    this.medical_history = medical_history;
  }
  current_time() {
    var today = new Date();
    var date =
      today.getDate() +
      "-" +
      (today.getMonth() + 1) +
      "-" +
      today.getFullYear();
    var time =
      today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var complete_date = date + ", " + time;
    return { complete_date };
  }

  protected store_animal (new_animal : iNew_Animal, callback : Function | null = null) {
    //function_that_checks_integrity](new_animal);
    let name = new_animal.name;
    localStorage.setItem(`BitLopezDev_Veterinay_V0.0.0:store_animal(${new_animal.name})`, JSON.stringify(new_animal));
    if (!!callback) {
      callback();
    }
  }
  protected revive_stored_animal () {
    let storedValue = localStorage.getItem('BitLopezDev_Veterinay_V0.0.0:store_animal');
  }

}

function the_emptyness(){}


function pre_edit() {
  let preElement : HTMLElement | null = document.getElementById("preElement");
  if (preElement) {
    preElement.innerHTML = JSON.stringify(VoCanimals);
  } else {
    throw new Error();
  }
}
