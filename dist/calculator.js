"use strict";
class Calculator {
    constructor(displayId) {
        const elem = document.getElementById(displayId);
        if (!elem) {
            throw new Error(`Element with id ${displayId} not found`);
        }
        this.display = elem;
    }
    append(value) {
        this.display.value += value;
    }
    clear() {
        this.display.value = '';
    }
    calculate() {
        try {
            // Using eval for simplicity; in production you may want a safer parser
            this.display.value = eval(this.display.value).toString();
        }
        catch (_a) {
            this.display.value = 'Error';
        }
    }
}
const calc = new Calculator('display');
document.querySelectorAll('[data-value]').forEach(btn => {
    btn.addEventListener('click', () => calc.append(btn.dataset.value));
});
document.getElementById('clear').addEventListener('click', () => calc.clear());
document.getElementById('equals').addEventListener('click', () => calc.calculate());
