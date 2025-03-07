-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bYs_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_bYs_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0111", 2 => "0011", 3 => "0110", 4 => "0010", 5 => "0110", 
    6 => "1011", 7 => "0100", 8 => "0011", 9 => "0001", 10 => "1100", 
    11 => "0110", 12 => "1010", 13 => "0110", 14 => "1100", 15 => "1010", 
    16 => "0011", 17 => "0111", 18 => "1100", 19 => "1011", 20 to 21=> "0000", 
    22 => "0101", 23 => "0000", 24 => "1001", 25 to 27=> "0000", 28 => "1001", 
    29 to 30=> "0111", 31 => "1101", 32 => "1000", 33 => "0110", 34 => "1011", 
    35 to 39=> "0000", 40 => "0010", 41 => "1000", 42 => "0000", 43 => "1011", 
    44 => "0000", 45 => "0100", 46 => "1001", 47 => "0011", 48 => "1011", 
    49 => "0100", 50 => "0011", 51 => "0100", 52 to 53=> "0000", 54 => "0100", 
    55 => "0110", 56 => "0000", 57 => "1100", 58 => "0000", 59 => "0100", 
    60 => "0010", 61 to 63=> "0000", 64 => "1000", 65 => "0110", 66 => "0111", 
    67 => "0000", 68 => "1010", 69 => "0000", 70 => "0111", 71 to 72=> "0000", 
    73 => "1000", 74 => "1010", 75 => "0000", 76 => "1000", 77 => "0000", 
    78 => "1011", 79 => "0011", 80 => "0010", 81 to 82=> "0000", 83 to 84=> "0001", 
    85 to 88=> "0000", 89 => "0011", 90 to 92=> "0000", 93 => "1010", 94 to 96=> "0000", 
    97 => "0001", 98 => "0000", 99 => "0101", 100 => "1000", 101 to 102=> "0000", 
    103 => "0001", 104 => "0000", 105 => "1010", 106 => "0000", 107 => "0111", 
    108 => "0101", 109 => "0000", 110 => "1101", 111 to 112=> "0000", 113 => "1100", 
    114 => "0110", 115 to 116=> "0000", 117 => "0110", 118 => "0011", 119 to 120=> "0000", 
    121 => "0101", 122 => "0001", 123 to 124=> "0000", 125 => "0110", 126 => "0000", 
    127 => "0100", 128 => "0000", 129 => "0011", 130 => "1011", 131 => "0001", 
    132 => "0000", 133 => "1000", 134 to 136=> "0000", 137 => "0110", 138 => "1100", 
    139 to 140=> "0000", 141 => "0111", 142 => "0110", 143 to 150=> "0000", 151 => "0011", 
    152 to 153=> "0000", 154 => "1010", 155 => "0001", 156 => "0000", 157 => "0110", 
    158 => "0000", 159 => "1011", 160 => "0000", 161 => "0101", 162 => "0000", 
    163 => "0101", 164 => "0110", 165 to 166=> "0000", 167 => "1010", 168 to 177=> "0000", 
    178 => "0101", 179 => "1011", 180 to 181=> "0000", 182 => "0101", 183 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_bYs is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bYs is
    component predict_ensemble_bYs_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bYs_rom_U :  component predict_ensemble_bYs_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


