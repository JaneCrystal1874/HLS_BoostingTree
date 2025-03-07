-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_e7X_rom is 
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


architecture rtl of predict_ensemble_e7X_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0011", 2 => "0111", 3 => "1101", 4 => "0101", 
    5 => "0000", 6 => "1000", 7 => "0111", 8 => "0000", 9 => "0100", 
    10 => "0000", 11 => "1011", 12 to 16=> "0000", 17 => "0001", 18 => "1001", 
    19 => "1011", 20 => "0000", 21 => "1001", 22 => "0001", 23 to 24=> "0000", 
    25 => "0011", 26 => "0111", 27 => "1010", 28 => "1100", 29 => "0000", 
    30 => "0111", 31 => "0000", 32 => "0001", 33 => "1011", 34 => "1000", 
    35 => "0000", 36 => "0101", 37 => "0011", 38 to 41=> "0000", 42 => "1011", 
    43 to 44=> "0000", 45 => "0110", 46 to 49=> "0000", 50 => "1011", 51 => "0001", 
    52 => "0110", 53 => "1011", 54 => "0100", 55 to 56=> "0000", 57 => "1000", 
    58 => "0010", 59 to 61=> "0101", 62 => "0000", 63 => "0110", 64 to 65=> "0000", 
    66 => "1101", 67 => "1010", 68 => "0000", 69 => "1011", 70 to 73=> "0000", 
    74 => "1000", 75 => "1101", 76 => "0011", 77 => "1010", 78 => "0000", 
    79 => "0110", 80 to 84=> "0000", 85 => "0011", 86 => "1001", 87 => "1000", 
    88 => "0100", 89 => "0000", 90 => "0100", 91 => "1000", 92 => "0001", 
    93 => "0110", 94 => "0101", 95 => "1011", 96 to 101=> "0000", 102 => "0100", 
    103 to 107=> "0000", 108 => "1101", 109 => "0000", 110 => "1011", 111 to 112=> "0100", 
    113 to 114=> "0000", 115 => "0111", 116 => "1011", 117 to 118=> "0000", 119 => "1001", 
    120 => "1011", 121 to 123=> "0000", 124 => "1100", 125 => "0000", 126 to 127=> "1101", 
    128 => "1001", 129 => "1101", 130 => "1100", 131 to 133=> "0000", 134 => "1100", 
    135 => "0100", 136 to 137=> "0001", 138 => "0000", 139 => "0001", 140 => "1010", 
    141 to 143=> "0000", 144 => "0100", 145 => "0000", 146 => "1010", 147 => "0010", 
    148 => "0001", 149 => "1010", 150 => "0000", 151 => "0100", 152 => "0000", 
    153 => "0011", 154 => "0001", 155 => "0000", 156 => "1011", 157 to 159=> "0000", 
    160 => "0011", 161 to 163=> "0000", 164 => "0011", 165 => "1011", 166 to 171=> "0000", 
    172 => "1010", 173 to 194=> "0000" );

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

entity predict_ensemble_e7X is
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

architecture arch of predict_ensemble_e7X is
    component predict_ensemble_e7X_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_e7X_rom_U :  component predict_ensemble_e7X_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


