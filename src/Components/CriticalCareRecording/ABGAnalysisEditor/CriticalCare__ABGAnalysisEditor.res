let str = React.string
open CriticalCare__Types

let handleSubmit = (handleDone, state) => {
  handleDone(state)
}
// PO2(mmHg)
// PCO2(mmHg)
// pH
// HCO3(mmol/L)
// Base Excess(mmol/L)
// Lactate(mmol/L)
// Sodium(mmol/L)
// Potassium(mmol/L)
type action =
  | SetPO2(string)
  | SetPCO2(string)
  | SetpH(string)
  | SetHCO3(string)
  | SetBaseExcess(string)
  | SetLactate(string)
  | SetSodium(string)
  | SetPotassium(string)

let reducer = (state, action) => {
  switch action {
  | SetPO2(po2) => {...state, ABGAnalysis.po2: po2}
  | SetPCO2(pco2) => {...state, pco2: pco2}
  | SetpH(pH) => {...state, pH: pH}
  | SetHCO3(hco3) => {...state, hco3: hco3}
  | SetBaseExcess(baseExcess) => {...state, baseExcess: baseExcess}
  | SetLactate(lactate) => {...state, lactate: lactate}
  | SetSodium(sodium) => {...state, sodium: sodium}
  | SetPotassium(potassium) => {...state, potassium: potassium}
  }
}

let getFieldValue = event => {
  ReactEvent.Form.target(event)["value"]
}

type state = ABGAnalysis.t

@react.component
let make = (~handleDone, ~initialState) => {
  let (state, send) = React.useReducer(reducer, initialState)
  <div>
    <CriticalCare__PageTitle title="Arterial Blood Gas Analysis" />
    <div className="my-4">
      <Slider
        title={"PO2 (mm Hg)"}
        start={"10"}
        end={"400"}
        interval={"50"}
        step={0.1}
        value={ABGAnalysis.po2(state)}
        setValue={s => send(SetPO2(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"PCO2 (mm Hg)"}
        start={"10"}
        end={"200"}
        interval={"20"}
        step={0.1}
        value={ABGAnalysis.pco2(state)}
        setValue={s => send(SetPCO2(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"pH"}
        start={"0.00"}
        end={"10.00"}
        interval={"1.00"}
        step={0.1}
        value={ABGAnalysis.pH(state)}
        setValue={s => send(SetpH(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"HCO3 (mmol/L)"}
        start={"5"}
        end={"80"}
        interval={"5"}
        step={0.1}
        value={ABGAnalysis.hco3(state)}
        setValue={s => send(SetHCO3(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"Base Excess (mmol/L)"}
        start={"-20"}
        end={"20"}
        interval={"5"}
        step={0.1}
        value={ABGAnalysis.baseExcess(state)}
        setValue={s => send(SetBaseExcess(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"Lactate (mmol/L)"}
        start={"0"}
        end={"20"}
        interval={"2"}
        step={0.1}
        value={ABGAnalysis.lactate(state)}
        setValue={s => send(SetLactate(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"Sodium (mmol/L)"}
        start={"100"}
        end={"170"}
        interval={"10"}
        step={0.1}
        value={ABGAnalysis.sodium(state)}
        setValue={s => send(SetSodium(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
      <Slider
        title={"Potassium (mmol/L)"}
        start={"1"}
        end={"10"}
        interval={"1"}
        step={0.1}
        value={ABGAnalysis.potassium(state)}
        setValue={s => send(SetPotassium(s))}
        getLabel={_ => ("Normal", "#ff0000")}
      />
    </div>
    <button
      className="flex w-full bg-blue-600 text-white p-2 text-lg hover:bg-blue-800 justify-center items-center rounded-md"
      onClick={_ => handleSubmit(handleDone, state)}>
      {str("Done")}
    </button>
  </div>
}
