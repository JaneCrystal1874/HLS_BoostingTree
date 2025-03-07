-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dfE_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_dfE_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 6=> "0", 7 to 8=> "1", 9 to 11=> "0", 
    12 to 14=> "1", 15 => "0", 16 => "1", 17 to 18=> "0", 19 to 20=> "1", 21 => "0", 22 => "1", 
    23 => "0", 24 to 25=> "1", 26 to 29=> "0", 30 to 31=> "1", 32 => "0", 33 to 34=> "1", 35 to 37=> "0", 
    38 to 39=> "1", 40 to 41=> "0", 42 to 44=> "1", 45 to 46=> "0", 47 => "1", 48 => "0", 49 to 50=> "1", 
    51 to 55=> "0", 56 to 58=> "1", 59 to 60=> "0", 61 to 63=> "1", 64 => "0", 65 to 66=> "1", 67 to 69=> "0", 
    70 to 71=> "1", 72 => "0", 73 to 75=> "1", 76 => "0", 77 => "1", 78 to 79=> "0", 80 to 81=> "1", 
    82 to 83=> "0", 84 => "1", 85 => "0", 86 => "1", 87 to 89=> "0", 90 => "1", 91 => "0", 
    92 to 93=> "1", 94 to 95=> "0", 96 to 97=> "1", 98 to 100=> "0", 101 to 102=> "1", 103 => "0", 104 => "1", 
    105 => "0", 106 to 107=> "1", 108 to 110=> "0", 111 to 114=> "1", 115 => "0", 116 => "1", 117 => "0", 
    118 => "1", 119 to 122=> "0", 123 => "1", 124 => "0", 125 to 128=> "1", 129 to 130=> "0", 131 to 132=> "1", 
    133 to 135=> "0", 136 to 138=> "1", 139 to 144=> "0", 145 => "1", 146 to 147=> "0", 148 => "1", 149 => "0", 
    150 to 153=> "1", 154 => "0", 155 to 158=> "1", 159 to 162=> "0", 163 => "1", 164 => "0", 165 to 166=> "1", 
    167 to 168=> "0", 169 to 172=> "1", 173 => "0", 174 to 175=> "1", 176 => "0", 177 => "1", 178 => "0", 
    179 => "1", 180 to 181=> "0", 182 to 184=> "1", 185 to 194=> "0" );

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

entity predict_ensemble_dfE is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_dfE is
    component predict_ensemble_dfE_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dfE_rom_U :  component predict_ensemble_dfE_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


