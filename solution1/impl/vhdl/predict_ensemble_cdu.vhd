-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cdu_rom is 
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


architecture rtl of predict_ensemble_cdu_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "1001", 2 => "0111", 3 => "0000", 4 => "1010", 
    5 to 6=> "0000", 7 => "0110", 8 => "1100", 9 => "0000", 10 => "1011", 
    11 to 13=> "0000", 14 => "1000", 15 => "1011", 16 to 17=> "0000", 18 => "1001", 
    19 => "0100", 20 => "1000", 21 to 22=> "0000", 23 => "1011", 24 => "1101", 
    25 => "0111", 26 => "0101", 27 => "0000", 28 => "0101", 29 => "1011", 
    30 => "0000", 31 => "0101", 32 => "0000", 33 => "1010", 34 to 36=> "0000", 
    37 => "1100", 38 => "0000", 39 => "0110", 40 to 41=> "0000", 42 => "0010", 
    43 => "0000", 44 => "0010", 45 => "0011", 46 => "1101", 47 to 51=> "0000", 
    52 => "0110", 53 => "0000", 54 to 55=> "0100", 56 => "0011", 57 => "1011", 
    58 => "0000", 59 => "0011", 60 => "0000", 61 => "1000", 62 to 64=> "0000", 
    65 => "0110", 66 => "1010", 67 => "0011", 68 => "0000", 69 => "0110", 
    70 to 71=> "0000", 72 => "1010", 73 to 74=> "0001", 75 to 76=> "0000", 77 => "0100", 
    78 => "0001", 79 to 83=> "0000", 84 => "0111", 85 => "1010", 86 => "0110", 
    87 => "0000", 88 => "1001", 89 => "0011", 90 => "0000", 91 => "0001", 
    92 => "0000", 93 => "0110", 94 => "0000", 95 => "0110", 96 => "0000", 
    97 => "1000", 98 => "0100", 99 => "0001", 100 => "0101", 101 => "1001", 
    102 => "0000", 103 => "1100", 104 => "1001", 105 => "0001", 106 => "1000", 
    107 to 108=> "0100", 109 => "0000", 110 => "0001", 111 => "0000", 112 => "0010", 
    113 to 114=> "0000", 115 => "1100", 116 => "0000", 117 => "1101", 118 => "1100", 
    119 => "0111", 120 to 124=> "0000", 125 => "0111", 126 => "1101", 127 => "1100", 
    128 to 129=> "0000", 130 => "0100", 131 => "1100", 132 => "1011", 133 to 136=> "0000", 
    137 => "0110", 138 => "0011", 139 to 140=> "0000", 141 => "0110", 142 => "0001", 
    143 => "1011", 144 to 145=> "1001", 146 to 147=> "0000", 148 => "1011", 149 to 154=> "0000", 
    155 => "0100", 156 => "0000", 157 => "0010", 158 => "0111", 159 to 160=> "0000", 
    161 => "0101", 162 => "1101", 163 => "0111", 164 => "0000", 165 => "1000", 
    166 to 170=> "0000", 171 => "1101", 172 => "1001", 173 to 176=> "0000", 177 => "1010", 
    178 to 179=> "0000", 180 => "0001", 181 => "0110", 182 to 194=> "0000" );

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

entity predict_ensemble_cdu is
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

architecture arch of predict_ensemble_cdu is
    component predict_ensemble_cdu_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cdu_rom_U :  component predict_ensemble_cdu_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


