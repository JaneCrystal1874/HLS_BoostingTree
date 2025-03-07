-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dEI_rom is 
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


architecture rtl of predict_ensemble_dEI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 6=> "0", 7 to 9=> "1", 10 to 13=> "0", 
    14 to 16=> "1", 17 to 19=> "0", 20 => "1", 21 => "0", 22 => "1", 23 => "0", 24 to 25=> "1", 
    26 to 27=> "0", 28 => "1", 29 to 30=> "0", 31 => "1", 32 to 33=> "0", 34 to 35=> "1", 36 to 37=> "0", 
    38 to 41=> "1", 42 => "0", 43 to 44=> "1", 45 to 49=> "0", 50 => "1", 51 => "0", 52 to 53=> "1", 
    54 => "0", 55 to 56=> "1", 57 to 58=> "0", 59 => "1", 60 to 61=> "0", 62 => "1", 63 => "0", 
    64 => "1", 65 => "0", 66 to 67=> "1", 68 to 69=> "0", 70 => "1", 71 to 72=> "0", 73 => "1", 
    74 to 75=> "0", 76 to 79=> "1", 80 => "0", 81 to 84=> "1", 85 to 87=> "0", 88 => "1", 89 => "0", 
    90 => "1", 91 to 92=> "0", 93 to 94=> "1", 95 to 96=> "0", 97 to 99=> "1", 100 => "0", 101 => "1", 
    102 to 103=> "0", 104 => "1", 105 to 107=> "0", 108 to 109=> "1", 110 => "0", 111 to 112=> "1", 113 => "0", 
    114 => "1", 115 => "0", 116 to 117=> "1", 118 to 121=> "0", 122 => "1", 123 => "0", 124 to 126=> "1", 
    127 => "0", 128 => "1", 129 to 131=> "0", 132 to 136=> "1", 137 => "0", 138 to 139=> "1", 140 => "0", 
    141 => "1", 142 to 146=> "0", 147 => "1", 148 to 150=> "0", 151 => "1", 152 to 153=> "0", 154 => "1", 
    155 to 156=> "0", 157 => "1", 158 => "0", 159 to 161=> "1", 162 => "0", 163 to 167=> "1", 168 => "0", 
    169 to 170=> "1", 171 to 172=> "0", 173 to 176=> "1", 177 to 194=> "0" );

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

entity predict_ensemble_dEI is
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

architecture arch of predict_ensemble_dEI is
    component predict_ensemble_dEI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dEI_rom_U :  component predict_ensemble_dEI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


