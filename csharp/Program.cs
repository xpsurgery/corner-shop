namespace ConsoleApplication
{
    using System;
    using Basket;
    using BasketActions;
    using CatalogueActions;
    using Filestore;
    using Products;
    using Ui;
    using Warehouse;
    using WarehouseActions;

    public class Program
    {
        public static void Main(string[] args)
        {
            DisplayWelcomeMessage();
            Warehouse warehouse = Warehouse.FromFile(new WarehouseReader("../warehouse.dat"));
            Catalogue catalogue = Catalogue.FromFile(new CatalogueReader("../catalogue.dat"));
            Basket basket = new Basket();
            CatalogueActions catalogueActions = new CatalogueActions(catalogue);
            WarehouseActions warehouseActions = new WarehouseActions(warehouse, catalogue);
            BasketActions basketActions = new BasketActions(basket, catalogue, warehouse);
            new UserInterface(catalogueActions, warehouseActions, basketActions).Start();
            DisplayGoodbyeMessage();
            Environment.Exit(0);
        }

        private static void DisplayGoodbyeMessage() {
            Console.WriteLine();
            Console.WriteLine("Goodbye. Thanks for your custom!");
            Console.WriteLine();
        }

        private static void DisplayWelcomeMessage() {
            Console.WriteLine("Welcome to our little corner shop!");
            Console.WriteLine();
            Console.WriteLine("For help, type 'h' or 'help' or '?'");
            Console.WriteLine();
        }

    }
}
