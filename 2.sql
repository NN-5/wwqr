1)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите первое число: ");
            double a = double.Parse(Console.ReadLine());
            
            Console.Write("Введите второе число: ");
            double b = double.Parse(Console.ReadLine());

            double sumSquares = a * a + b * b;
            double squareSum = (a + b) * (a + b);

            if (sumSquares > squareSum)
            {
                Console.WriteLine("Сумма квадратов больше");
            }
            else if (squareSum > sumSquares)
            {
                Console.WriteLine("Квадрат суммы больше");
            }
            else
            {
                Console.WriteLine("Числа равны");
            }

            Console.ReadKey();
        }
    }
}

2)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите зарплату: ");
            double salary = double.Parse(Console.ReadLine());
            
            Console.Write("Введите стаж: ");
            int experience = int.Parse(Console.ReadLine());

            double bonus = 0;

            if (experience >= 2 && experience < 5)
            {
                bonus = salary * 0.02;
            }
            else if (experience >= 5 && experience < 10)
            {
                bonus = salary * 0.05;
            }

            double total = salary + bonus;

            Console.WriteLine($"Надбавка: {bonus:F2}");
            Console.WriteLine($"Сумма к выплате: {total:F2}");

            Console.ReadKey();
        }
    }
}

3)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите x точки A: ");
            double x0 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y точки A: ");
            double y0 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите x точки B: ");
            double x1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y точки B: ");
            double y1 = double.Parse(Console.ReadLine());

            double distA = Math.Sqrt(x0 * x0 + y0 * y0);
            double distB = Math.Sqrt(x1 * x1 + y1 * y1);

            if (distA > distB)
            {
                Console.WriteLine("Точка A наиболее удалена от начала координат");
            }
            else if (distB > distA)
            {
                Console.WriteLine("Точка B наиболее удалена от начала координат");
            }
            else
            {
                Console.WriteLine("Точки равноудалены от начала координат");
            }

            Console.ReadKey();
        }
    }
}

4)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите сторону a: ");
            double a = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону b: ");
            double b = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону c: ");
            double c = double.Parse(Console.ReadLine());

            if (a * a + b * b == c * c || a * a + c * c == b * b || b * b + c * c == a * a)
            {
                Console.WriteLine("Треугольник прямоугольный");
            }
            else
            {
                Console.WriteLine("Треугольник не прямоугольный");
            }

            Console.ReadKey();
        }
    }
}

5)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите первое число: ");
            double num1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите второе число: ");
            double num2 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите третье число: ");
            double num3 = double.Parse(Console.ReadLine());

            if (num1 > 0) num1 = num1 * num1;
            if (num2 > 0) num2 = num2 * num2;
            if (num3 > 0) num3 = num3 * num3;

            Console.WriteLine($"Результаты: {num1}, {num2}, {num3}");

            Console.ReadKey();
        }
    }
}

6)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите x: ");
            double x = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y: ");
            double y = double.Parse(Console.ReadLine());

            if (x > 0 && y > 0)
            {
                Console.WriteLine("Точка в первой четверти");
            }
            else if (x < 0 && y > 0)
            {
                Console.WriteLine("Точка во второй четверти");
            }
            else if (x < 0 && y < 0)
            {
                Console.WriteLine("Точка в третьей четверти");
            }
            else if (x > 0 && y < 0)
            {
                Console.WriteLine("Точка в четвертой четверти");
            }
            else
            {
                Console.WriteLine("Точка на оси координат");
            }

            Console.ReadKey();
        }
    }
}

7)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите x: ");
            double x = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y: ");
            double y = double.Parse(Console.ReadLine());
            
            Console.Write("Введите радиус R: ");
            double R = double.Parse(Console.ReadLine());

            double distance = Math.Sqrt(x * x + y * y);

            if (distance <= R)
            {
                Console.WriteLine("Точка лежит внутри окружности");
            }
            else
            {
                Console.WriteLine("Точка лежит вне окружности");
            }

            Console.ReadKey();
        }
    }
}

8)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите сторону a1: ");
            double a1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону b1: ");
            double b1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону c1: ");
            double c1 = double.Parse(Console.ReadLine());

            Console.Write("Введите сторону a2: ");
            double a2 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону b2: ");
            double b2 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите сторону c2: ");
            double c2 = double.Parse(Console.ReadLine());

            double p1 = (a1 + b1 + c1) / 2;
            double area1 = Math.Sqrt(p1 * (p1 - a1) * (p1 - b1) * (p1 - c1));

            double p2 = (a2 + b2 + c2) / 2;
            double area2 = Math.Sqrt(p2 * (p2 - a2) * (p2 - b2) * (p2 - c2));

            if (area1 > area2)
            {
                Console.WriteLine("Площадь первого треугольника больше");
            }
            else if (area2 > area1)
            {
                Console.WriteLine("Площадь второго треугольника больше");
            }
            else
            {
                Console.WriteLine("Площади треугольников равны");
            }

            Console.ReadKey();
        }
    }
}

9)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите сторону квадрата a: ");
            double a = double.Parse(Console.ReadLine());
            
            Console.Write("Введите радиус окружности R: ");
            double R = double.Parse(Console.ReadLine());

            double squareArea = a * a;
            double circleArea = Math.PI * R * R;

            if (squareArea > circleArea)
            {
                Console.WriteLine("Площадь квадрата больше");
            }
            else if (circleArea > squareArea)
            {
                Console.WriteLine("Площадь окружности больше");
            }
            else
            {
                Console.WriteLine("Площади равны");
            }

            Console.ReadKey();
        }
    }
}

10)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите первое число: ");
            double num1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите второе число: ");
            double num2 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите третье число: ");
            double num3 = double.Parse(Console.ReadLine());

            if (num1 > 0) num1 = num1 * num1 * num1;
            else num1 = 0;

            if (num2 > 0) num2 = num2 * num2 * num2;
            else num2 = 0;

            if (num3 > 0) num3 = num3 * num3 * num3;
            else num3 = 0;

            Console.WriteLine($"Результаты: {num1}, {num2}, {num3}");

            Console.ReadKey();
        }
    }
}

11)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите натуральное число: ");
            int number = int.Parse(Console.ReadLine());

            if (number % 2 == 0)
            {
                Console.WriteLine("Число четное");
            }
            
            if (number % 10 == 3)
            {
                Console.WriteLine("Число оканчивается цифрой 3");
            }

            if (number % 2 != 0 && number % 10 != 3)
            {
                Console.WriteLine("Число нечетное и не оканчивается на 3");
            }

            Console.ReadKey();
        }
    }
}

12)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите x: ");
            double x = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y: ");
            double y = double.Parse(Console.ReadLine());

            if (x > 0 && y > 0)
            {
                Console.WriteLine("Точка лежит в первой четверти");
            }
            else
            {
                Console.WriteLine("Точка не лежит в первой четверти");
            }

            Console.ReadKey();
        }
    }
}

13)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите сумму вклада: ");
            double deposit = double.Parse(Console.ReadLine());
            
            Console.Write("Введите срок договора (6 или 12 месяцев): ");
            int term = int.Parse(Console.ReadLine());

            double monthlyInterest = 0;

            if (term == 6)
            {
                monthlyInterest = deposit * 0.06 / 12;
            }
            else if (term == 12)
            {
                monthlyInterest = deposit * 0.08 / 12;
            }

            Console.WriteLine($"Ежемесячная выплата процентов: {monthlyInterest:F2}");

            Console.ReadKey();
        }
    }
}

14)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите первое число: ");
            double a = double.Parse(Console.ReadLine());
            
            Console.Write("Введите второе число: ");
            double b = double.Parse(Console.ReadLine());

            double diffSquares = a * a - b * b;
            double squareDiff = (a - b) * (a - b);

            if (Math.Abs(diffSquares) > Math.Abs(squareDiff))
            {
                Console.WriteLine("Разность квадратов больше по модулю");
            }
            else if (Math.Abs(squareDiff) > Math.Abs(diffSquares))
            {
                Console.WriteLine("Квадрат разности больше по модулю");
            }
            else
            {
                Console.WriteLine("Значения равны по модулю");
            }

            Console.ReadKey();
        }
    }
}

15)
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Введите x точки A: ");
            double x0 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y точки A: ");
            double y0 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите x точки B: ");
            double x1 = double.Parse(Console.ReadLine());
            
            Console.Write("Введите y точки B: ");
            double y1 = double.Parse(Console.ReadLine());

            double distA = Math.Sqrt(x0 * x0 + y0 * y0);
            double distB = Math.Sqrt(x1 * x1 + y1 * y1);

            if (distA < distB)
            {
                Console.WriteLine("Точка A наименее удалена от начала координат");
            }
            else if (distB < distA)
            {
                Console.WriteLine("Точка B наименее удалена от начала координат");
            }
            else
            {
                Console.WriteLine("Точки равноудалены от начала координат");
            }

            Console.ReadKey();
        }
    }
}
