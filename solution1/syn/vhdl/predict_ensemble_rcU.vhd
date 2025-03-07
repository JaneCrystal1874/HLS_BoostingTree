-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_rcU_rom is 
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


architecture rtl of predict_ensemble_rcU_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "1011", 3 => "1100", 4 => "0000", 5 => "1100", 6 => "0110", 
    7 => "0100", 8 to 10=> "0000", 11 => "1011", 12 => "1000", 13 => "0011", 
    14 => "0000", 15 => "1001", 16 => "1011", 17 to 22=> "0000", 23 => "0111", 
    24 => "1010", 25 => "0100", 26 => "0101", 27 => "0111", 28 => "0010", 
    29 to 33=> "0000", 34 => "1100", 35 to 37=> "0000", 38 => "1001", 39 => "0001", 
    40 => "1001", 41 to 42=> "0000", 43 => "1011", 44 => "0101", 45 => "1001", 
    46 => "0011", 47 => "1100", 48 to 51=> "0000", 52 => "0011", 53 => "1000", 
    54 => "1100", 55 => "0011", 56 => "1000", 57 => "1010", 58 => "0100", 
    59 => "1010", 60 => "0101", 61 => "0111", 62 => "1000", 63 to 66=> "0000", 
    67 => "1000", 68 => "0010", 69 => "0110", 70 => "0000", 71 => "1011", 
    72 to 76=> "0000", 77 => "0100", 78 => "1101", 79 => "0011", 80 => "0100", 
    81 => "0000", 82 => "1010", 83 => "0100", 84 => "0001", 85 to 86=> "0000", 
    87 => "0100", 88 => "0001", 89 => "1010", 90 to 94=> "0000", 95 => "0110", 
    96 => "0101", 97 => "1100", 98 => "1101", 99 => "0000", 100 => "1010", 
    101 to 103=> "0000", 104 => "1010", 105 => "0000", 106 => "0110", 107 to 108=> "0000", 
    109 => "1100", 110 => "1011", 111 => "1101", 112 => "1001", 113 => "1000", 
    114 to 116=> "0000", 117 => "1011", 118 => "1001", 119 => "1010", 120 => "0101", 
    121 => "1011", 122 to 124=> "0000", 125 => "0010", 126 => "0111", 127 to 133=> "0000", 
    134 => "1101", 135 to 138=> "0000", 139 => "0111", 140 => "0000", 141 => "0110", 
    142 => "0101", 143 to 144=> "0000", 145 => "1011", 146 to 147=> "0000", 148 => "0101", 
    149 => "1000", 150 => "0001", 151 => "0000", 152 => "1101", 153 => "0000", 
    154 => "0100", 155 => "0000", 156 => "1010", 157 => "0110", 158 => "1011", 
    159 => "1001", 160 => "0110", 161 to 163=> "0000", 164 => "0111", 165 to 166=> "0000", 
    167 => "0011", 168 => "0101", 169 => "1101", 170 to 173=> "0000", 174 => "1000", 
    175 to 176=> "0000", 177 => "0111", 178 to 182=> "0000", 183 => "0001", 184 to 194=> "0000" );

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

entity predict_ensemble_rcU is
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

architecture arch of predict_ensemble_rcU is
    component predict_ensemble_rcU_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_rcU_rom_U :  component predict_ensemble_rcU_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


