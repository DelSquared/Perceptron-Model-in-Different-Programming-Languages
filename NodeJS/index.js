class Perceptron { 
   constructor() { 
      this.w=[Math.random(),Math.random()];
      this.b=Math.random();
   }  

   Eval(x){ 
      return 1/(1+Math.exp(-(this.w[0]*x[0]+this.w[1]*x[1]+this.b)));
   } 

   Train(data,label,epochs,dt){ 
     let outputcontrol = Math.floor(epochs/10);
      for(let i=0;i<epochs;i++){
        for(let j=0;j<4;j++){
          this.w[0] += (label[j]-this.Eval(data[j]))*(this.Eval(data[j])-this.Eval(data[j])*this.Eval(data[j]))*data[j][0]*dt;

          this.w[1] += (label[j]-this.Eval(data[j]))*(this.Eval(data[j])-this.Eval(data[j])*this.Eval(data[j]))*data[j][1]*dt;

          this.b += (label[j]-this.Eval(data[j]))*(this.Eval(data[j])-this.Eval(data[j])*this.Eval(data[j]))*dt;
        }
        if(i%outputcontrol==0){
          console.log(`Epoch(%): ${i*100/epochs}% ... Error: ${((label[1]-this.Eval(data[1]))*(label[1]-this.Eval(data[1])))}`);
        }
      }
   } 
}

let p = new Perceptron();

let x=[[0,0],[1,0],[0,1],[1,1]];
let y=[0,0,0,1]; //AND gate

console.log("Pre-Training");
for(var i=0;i<4;i++){
  console.log(p.Eval(x[i]));
}
console.log("");

p.Train(x,y,1000000,0.01);

console.log("\nPost-Training");
for(var i=0;i<4;i++){
  console.log(p.Eval(x[i]));
}
console.log("");
