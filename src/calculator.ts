import * as math from 'mathjs';

class Calculator {
  private display: HTMLInputElement;

  constructor(displayId: string) {
    const elem = document.getElementById(displayId);
    if (!elem) {
      throw new Error(`Element with id ${displayId} not found`);
    }
    this.display = elem as HTMLInputElement;
  }

  append(value: string): void {
    this.display.value += value;
  }

  clear(): void {
    this.display.value = '';
  }

  calculate(): void {
    try {
      // Use mathjs for safe mathematical expression evaluation
      const result = math.evaluate(this.display.value);
      this.display.value = result.toString();
    } catch {
      this.display.value = 'Error';
    }
  }
}

const calc = new Calculator('display');

document.querySelectorAll<HTMLButtonElement>('[data-value]').forEach(btn => {
  btn.addEventListener('click', () => calc.append(btn.dataset.value!));
});

document.getElementById('clear')!.addEventListener('click', () => calc.clear());

document.getElementById('equals')!.addEventListener('click', () => calc.calculate());
