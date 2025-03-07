-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_d4N_rom is 
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


architecture rtl of predict_ensemble_d4N_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "1011", 3 => "0000", 4 to 5=> "0101", 
    6 => "0000", 7 to 8=> "1011", 9 => "0111", 10 => "0011", 11 => "0000", 
    12 => "0101", 13 to 15=> "0000", 16 => "1001", 17 => "0010", 18 to 19=> "0000", 
    20 => "0010", 21 => "0110", 22 => "1000", 23 to 24=> "0010", 25 to 26=> "0000", 
    27 => "1010", 28 => "0000", 29 => "1011", 30 to 31=> "0000", 32 => "0111", 
    33 => "0000", 34 => "0100", 35 => "0001", 36 => "0000", 37 => "1010", 
    38 => "1001", 39 => "0000", 40 => "0101", 41 => "0000", 42 => "1000", 
    43 => "0000", 44 => "1001", 45 => "0000", 46 => "0101", 47 => "0011", 
    48 => "0000", 49 => "0101", 50 to 51=> "0000", 52 => "0001", 53 to 54=> "0000", 
    55 to 56=> "0111", 57 to 59=> "0000", 60 => "0111", 61 to 63=> "0000", 64 => "0011", 
    65 => "0000", 66 => "1001", 67 to 68=> "0000", 69 => "1001", 70 => "1011", 
    71 => "1001", 72 to 73=> "0000", 74 => "0001", 75 => "0000", 76 => "0101", 
    77 => "0000", 78 => "0010", 79 => "0000", 80 => "1010", 81 => "1101", 
    82 => "0001", 83 to 85=> "0000", 86 => "0100", 87 => "0011", 88 => "0010", 
    89 to 91=> "0000", 92 => "0011", 93 => "0000", 94 => "1010", 95 to 96=> "0000", 
    97 => "0010", 98 => "0000", 99 => "1000", 100 => "0011", 101 => "1011", 
    102 => "0100", 103 to 104=> "0000", 105 => "0110", 106 => "0111", 107 to 111=> "0000", 
    112 => "0010", 113 => "0111", 114 => "0000", 115 => "1001", 116 => "0111", 
    117 to 119=> "0000", 120 => "0011", 121 => "1000", 122 => "0000", 123 => "0111", 
    124 to 125=> "0101", 126 => "1001", 127 => "0011", 128 => "0110", 129 => "0000", 
    130 => "1001", 131 to 134=> "0000", 135 => "1010", 136 to 139=> "0000", 140 => "0110", 
    141 => "1001", 142 => "1011", 143 => "0101", 144 => "1100", 145 => "0110", 
    146 to 148=> "0000", 149 => "1001", 150 => "0000", 151 => "0111", 152 => "0011", 
    153 => "0000", 154 => "1010", 155 => "0000", 156 => "0101", 157 => "0110", 
    158 => "0000", 159 => "0101", 160 => "0000", 161 => "0010", 162 to 165=> "0000", 
    166 => "0110", 167 => "0000", 168 => "0011", 169 => "1011", 170 to 171=> "0000", 
    172 => "1101", 173 => "0110", 174 => "0000", 175 => "0011", 176 => "0000", 
    177 => "0001", 178 to 194=> "0000" );

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

entity predict_ensemble_d4N is
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

architecture arch of predict_ensemble_d4N is
    component predict_ensemble_d4N_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_d4N_rom_U :  component predict_ensemble_d4N_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


