-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bQq_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bQq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000001", 1 => "00000011", 2 => "00000101", 3 to 5=> "00000000", 
    6 => "00000111", 7 => "00001001", 8 to 9=> "00000000", 10 => "00001011", 
    11 => "00001101", 12 => "00001111", 13 => "00010001", 14 => "00010011", 
    15 => "00010101", 16 to 17=> "00000000", 18 => "00010111", 19 => "00011001", 
    20 => "00011011", 21 => "00011101", 22 to 23=> "00000000", 24 => "00011111", 
    25 => "00100001", 26 => "00000000", 27 => "00100011", 28 => "00100101", 
    29 to 34=> "00000000", 35 => "00100111", 36 => "00000000", 37 => "00101001", 
    38 => "00000000", 39 => "00101011", 40 => "00101101", 41 => "00101111", 
    42 => "00110001", 43 => "00110011", 44 to 47=> "00000000", 48 => "00110101", 
    49 to 53=> "00000000", 54 => "00110111", 55 => "00111001", 56 => "00111011", 
    57 => "00111101", 58 => "00111111", 59 => "00000000", 60 => "01000001", 
    61 to 64=> "00000000", 65 => "01000011", 66 => "01000101", 67 to 68=> "00000000", 
    69 => "01000111", 70 => "01001001", 71 to 72=> "00000000", 73 => "01001011", 
    74 => "01001101", 75 => "01001111", 76 to 78=> "00000000", 79 => "01010001", 
    80 => "01010011", 81 => "01010101", 82 => "01010111", 83 to 84=> "00000000", 
    85 => "01011001", 86 => "00000000", 87 => "01011011", 88 => "00000000", 
    89 => "01011101", 90 => "00000000", 91 => "01011111", 92 => "01100001", 
    93 => "01100011", 94 => "01100101", 95 => "01100111", 96 to 99=> "00000000", 
    100 => "01101001", 101 => "00000000", 102 => "01101011", 103 => "01101101", 
    104 => "00000000", 105 => "01101111", 106 => "00000000", 107 => "01110001", 
    108 => "01110011", 109 => "01110101", 110 to 114=> "00000000", 115 => "01110111", 
    116 => "00000000", 117 => "01111001", 118 => "01111011", 119 => "00000000", 
    120 => "01111101", 121 => "01111111", 122 => "00000000", 123 => "10000001", 
    124 => "10000011", 125 to 127=> "00000000", 128 => "10000101", 129 => "10000111", 
    130 => "10001001", 131 => "10001011", 132 to 134=> "00000000", 135 => "10001101", 
    136 => "10001111", 137 => "10010001", 138 => "10010011", 139 => "00000000", 
    140 => "10010101", 141 => "10010111", 142 => "10011001", 143 to 144=> "00000000", 
    145 => "10011011", 146 => "00000000", 147 => "10011101", 148 => "10011111", 
    149 to 151=> "00000000", 152 => "10100001", 153 to 154=> "00000000", 155 => "10100011", 
    156 => "00000000", 157 => "10100101", 158 => "10100111", 159 => "00000000", 
    160 => "10101001", 161 to 164=> "00000000", 165 => "10101011", 166 => "10101101", 
    167 => "10101111", 168 to 169=> "00000000", 170 => "10110001", 171 => "10110011", 
    172 => "00000000", 173 => "10110101", 174 => "10110111", 175 => "10111001", 
    176 to 194=> "00000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bQq is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bQq is
    component predict_ensemble_bQq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bQq_rom_U :  component predict_ensemble_bQq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


