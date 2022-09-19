// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {

      //قیمت عرضه
        function totalSupply() external view returns (uint256);
   
      //موجودی یک ادرس
        function balanceOf(address account) external view returns (uint256);

      //برای نتقال پول به یک ادرس 
        function transfer(address to, uint256 amount) external returns (bool);

      //بیشتر مربوط به صرافی
        function transferFrom(
         address from,
         address to,
         uint256 amount
        ) external returns (bool);

      //دسترسی میده به صرافی ها
        function allowance(address owner, address spender) external view returns (uint256);


        function approve(address spender, uint256 amount) external returns (bool);

        event Transfer(address indexed from, address indexed to, uint256 value);
        event Approval(address indexed owner, address indexed spender, uint256 value);
}