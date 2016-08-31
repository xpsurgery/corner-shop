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
            displayWelcomeMessage();
            Warehouse warehouse = Warehouse.fromFile(new WarehouseReader("./warehouse.dat"));
            Catalogue catalogue = Catalogue.fromFile(new CatalogueReader("./catalogue.dat"));
            Basket basket = new Basket();
            CatalogueActions catalogueActions = new CatalogueActions(catalogue);
            WarehouseActions warehouseActions = new WarehouseActions(warehouse, catalogue);
            BasketActions basketActions = new BasketActions(basket, catalogue, warehouse);
            new UserInterface(catalogueActions, warehouseActions, basketActions).start();
            displayGoodbyeMessage();
            Environment.Exit(0);
        }

        private static void displayGoodbyeMessage() {
            Console.WriteLine();
            Console.WriteLine("Goodbye. Thanks for your custom!");
            Console.WriteLine();
        }

        private static void displayWelcomeMessage() {
            Console.WriteLine("Welcome to our little corner shop!");
            Console.WriteLine();
            Console.WriteLine("For help, type 'h' or 'help' or '?'");
            Console.WriteLine();
        }

    }
}
