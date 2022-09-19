// SPDX-License-Identifier: MIT

import "./IERC20.sol";
import "./Context.sol";
import "./Ownable.sol";
import "./SafeMath.sol";

pragma solidity ^0.8.0;
contract ERC20 is Context,Ownable,IERC20
{
   using SafeMath for uint256;

     mapping(address => uint256) _balances;
     mapping(address => mapping(address => uint256)) private _allowances;

     //تعداد کل توکن
     uint256 private _totalSupply;

     //میزان رقم اعشار برای قیمت توکن  5=0.00001  
     uint256 private _decimalse;

     //name:ethereum , bitcoin
     string private _name;
     //symbol:eth ,btc
     string private _symbol;

     constructor(string memory name_, string memory symbol_,uint256 totalSupply_,uint256 decimalse_)
      {
        _name = name_;
        _symbol = symbol_;
        _totalSupply = totalSupply_;
        _decimalse = decimalse_;
      }

     function name() public view virtual  returns (string memory)
      {
         return _name;
      }

     function symbol() public view virtual returns (string memory) 
     {
         return _symbol;
     }

      function decimals() public view virtual  returns (uint256) 
      {
        return _decimalse;
      }

       function totalSupply() public view virtual override returns (uint256) 
      {
        return _totalSupply;
      }
      
      function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
      }


     //style for tarnsferfrom
     function _transfer(address from,address to,uint256 amount) internal virtual 
     {
         require(from != address(0), "ERC20: transfer from the zero address");
         require(to != address(0), "ERC20: transfer to the zero address");
         uint256 fromBalance = _balances[from];
         require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
         _balances[from] = fromBalance.sub(amount);
         _balances[to] = _balances[to].add(amount);
         emit Transfer (from,  to, amount);

     }
     
     //برای دسترسی دادن به transferfrom
     function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
   
     function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address from = _msgSender();
        _transfer(from, to, amount);
        return true;
    }
    
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

     function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        require(amount <= _allowances[from][spender] );
        _allowances[from][spender] = _allowances[from][spender].sub(amount);
       // _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }
}