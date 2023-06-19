"use strict";
document.addEventListener("DOMContentLoaded", function () {
    // Your code here
    pre_edit();
});
const animals = {
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
class animal {
    constructor(animalid, name, owner_id, ensured, for_adoption, belongs_to_vet, created_at, medical_history, ...rest) {
        // this.animalid = animalid;
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
        var date = today.getDate() +
            "-" +
            (today.getMonth() + 1) +
            "-" +
            today.getFullYear();
        var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        var complete_date = date + ", " + time;
        return { complete_date };
    }
}
function pre_edit() {
    let preElement = document.getElementById("preElement");
    if (preElement) {
        preElement.innerHTML = JSON.stringify(animals);
    }
    else {
        throw new Error();
    }
}
