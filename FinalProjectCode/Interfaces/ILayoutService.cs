using FinalProjectCode.Models;

namespace FinalProjectCode.Interfaces
{
    public interface ILayoutService
    {
        Task<List<Setting>> GetSetting();
        Task<IEnumerable<Category>> GetCategories();
        //Task<List<BasketVM>> GetBasket();
    }
}
