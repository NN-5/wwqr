16)
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
            Console.Write("Введите первую сторону: ");
            int a = int.Parse(Console.ReadLine());
            
            Console.Write("Введите вторую сторону: ");
            int b = int.Parse(Console.ReadLine());
            
            Console.Write("Введите третью сторону: ");
            int c = int.Parse(Console.ReadLine());

            if (a + b > c && a + c > b && b + c > a)
            {
                Console.WriteLine("Треугольник существует");
            }
            else
            {
                Console.WriteLine("Треугольник не существует");
            }

            Console.ReadKey();
        }
    }
}

17)
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

            double f1 = Math.Sqrt(Math.Pow(Math.Sin(x * x * x), 2) + 4 * Math.Pow(Math.Sin(x), 2) + 4 * x * x);
            double f2 = Math.Sqrt(6 * Math.Asin(x * x * x * x * x * x * x) + 4 * Math.Pow(Math.Cos(x), 2) + 4 * x * x);
            
            double eps = 0.001;

            if (Math.Abs(f1 - y) < eps || Math.Abs(f2 - y) < eps)
            {
                Console.WriteLine("Точка лежит на кривой");
            }
            else
            {
                Console.WriteLine("Точка не лежит на кривой");
            }

            Console.ReadKey();
        }
    }
}

18)
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
            double x = 3.5;
            double y = 72;

            if (y >= 0 && y <= 2 - x * x)
            {
                Console.WriteLine("Точка лежит в области");
            }
            else
            {
                Console.WriteLine("Точка не лежит в области");
            }

            Console.ReadKey();
        }
    }
}

19)
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

20)
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

21)
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
            double W = 30000;
            double r_min = 1;
            double r_max = 6;
            
            double m0 = 9.1e-31;
            double e = 1.6e-19;
            
            double v = Math.Sqrt(2 * W * e / m0);
            
            double B_min = m0 * v / (e * r_max);
            double B_max = m0 * v / (e * r_min);
            
            Console.WriteLine($"Диапазон индукции B: от {B_min:E3} Тл до {B_max:E3} Тл");
            
            Console.ReadKey();
        }
    }
}

22)
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
            Console.Write("Введите точку a: ");
            double a = double.Parse(Console.ReadLine());
            
            Console.Write("Введите точку b: ");
            double b = double.Parse(Console.ReadLine());
            
            Console.Write("Введите точку c: ");
            double c = double.Parse(Console.ReadLine());

            double dist_ab = Math.Abs(b - a);
            double dist_ac = Math.Abs(c - a);

            if (dist_ab < dist_ac)
            {
                Console.WriteLine("Точка b ближе к a");
            }
            else if (dist_ac < dist_ab)
            {
                Console.WriteLine("Точка c ближе к a");
            }
            else
            {
                Console.WriteLine("Точки b и c равноудалены от a");
            }

            Console.ReadKey();
        }
    }
}

23)
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
            Console.Write("Введите число a: ");
            int a = int.Parse(Console.ReadLine());
            
            Console.Write("Введите число b: ");
            int b = int.Parse(Console.ReadLine());

            if (a % b == 0 && b % a == 0)
            {
                Console.WriteLine("Числа являются делителями друг друга");
            }
            else if (a % b == 0)
            {
                Console.WriteLine("b является делителем a");
            }
            else if (b % a == 0)
            {
                Console.WriteLine("a является делителем b");
            }
            else
            {
                Console.WriteLine("Числа не являются делителями друг друга");
            }

            Console.ReadKey();
        }
    }
}

24)
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
            Console.Write("Введите число a: ");
            int a = int.Parse(Console.ReadLine());
            
            Console.Write("Введите число b: ");
            int b = int.Parse(Console.ReadLine());
            
            Console.Write("Введите число c: ");
            int c = int.Parse(Console.ReadLine());

            if (a == b || a == c || b == c)
            {
                Console.WriteLine("Есть хотя бы одна пара равных чисел");
            }
            else
            {
                Console.WriteLine("Нет пар равных чисел");
            }

            Console.ReadKey();
        }
    }
}

25)
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
            Console.Write("Введите скорость электрона (1-12 Мм/с): ");
            double v = double.Parse(Console.ReadLine()) * 1e6;
            
            double m0 = 9.1e-31;
            double e = 1.6e-19;
            double B = 56e-3;
            
            double r = m0 * v / (e * B);
            
            double r_target_min = 0.5;
            double r_target_max = 1.5;

            if (r >= r_target_min && r <= r_target_max)
            {
                Console.WriteLine("Траектория попадает в кольцо");
            }
            else
            {
                Console.WriteLine("Траектория не попадает в кольцо");
            }

            Console.ReadKey();
        }
    }
}

26)
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

            double average = (num1 + num2 + num3) / 3;

            Console.WriteLine("Числа по модулю больше среднего арифметического:");
            
            if (Math.Abs(num1) > average)
                Console.WriteLine(num1);
            
            if (Math.Abs(num2) > average)
                Console.WriteLine(num2);
            
            if (Math.Abs(num3) > average)
                Console.WriteLine(num3);

            Console.ReadKey();
        }
    }
}

27)
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
            Console.Write("Введите текущее время (0-23): ");
            int time = int.Parse(Console.ReadLine());

            if (time >= 6 && time < 12)
            {
                Console.WriteLine("Утро");
            }
            else if (time >= 12 && time < 18)
            {
                Console.WriteLine("День");
            }
            else if (time >= 18 && time < 24)
            {
                Console.WriteLine("Вечер");
            }
            else if (time >= 0 && time < 6)
            {
                Console.WriteLine("Ночь");
            }
            else
            {
                Console.WriteLine("Некорректное время");
            }

            Console.ReadKey();
        }
    }
}

28)using System;
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
            double G = 6.7e-8;
            
            double mv = 4.86e27;
            double rv = 6175 * 1e5;
            
            double mz = 5.98e27;
            double rz = 6371 * 1e5;
            
            double ms = 5.68e29;
            double rs = 57750 * 1e5;

            double gv = G * mv / (rv * rv);
            double gz = G * mz / (rz * rz);
            double gs = G * ms / (rs * rs);

            if (gv > gz && gv > gs)
            {
                Console.WriteLine("Венера имеет наибольшее ускорение силы тяжести");
            }
            else if (gz > gv && gz > gs)
            {
                Console.WriteLine("Земля имеет наибольшее ускорение силы тяжести");
            }
            else
            {
                Console.WriteLine("Сатурн имеет наибольшее ускорение силы тяжести");
            }

            Console.ReadKey();
        }
    }
}
