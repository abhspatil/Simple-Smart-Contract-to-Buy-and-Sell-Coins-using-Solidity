pragma solidity >=0.4.22;

contract Patil_coin{
    
    uint public max_coins=1000000;
    
    uint public INR_to_Patil_coins=100;
    
    uint public Total_Patil_coins=0;
    
    mapping(address =>uint) equity_Patil_coins;
    mapping(address =>uint) equity_INR;
    
    modifier can_BUY_Patil_Coins(uint INR_invested){
        require(INR_invested * INR_to_Patil_coins + Total_Patil_coins <=max_coins);
        _;
    }
    
    function equity_in_Patil_Coins(address investor) external view returns (uint){
        return equity_Patil_coins[investor];
    }
    
    function equity_in_INR(address investor) external view returns (uint){
        return equity_INR[investor]; 
    }
    
    function Buy_Patil_coins(address investor,uint INR_invested) external can_BUY_Patil_Coins(INR_invested){
        
        uint Patil_coins_Bought = INR_invested * INR_to_Patil_coins;
        equity_INR[investor]=equity_Patil_coins[investor]/100;
        equity_Patil_coins[investor] += Patil_coins_Bought;
        
        Total_Patil_coins += Patil_coins_Bought;
        
    }
    
    function Sell_Patil_Coins(address investor,uint Patil_Coins_Sold) external {
        
        equity_Patil_coins[investor] -= Patil_Coins_Sold;
        equity_INR[investor] = equity_Patil_coins[investor] / 100 ;
        Total_Patil_coins -= Patil_Coins_Sold;
    }
    
    
}
